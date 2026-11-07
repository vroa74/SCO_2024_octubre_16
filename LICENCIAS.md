# Validacion de licencias al iniciar

Implementacion en main.pas y eventos en main.dfm. El archivo de datos se obtiene del directorio del ejecutable: dll/mysqld.dll. No se carga como biblioteca de Windows.

## Comportamiento

- Al iniciar solo se muestran el fondo y el panel de acceso. El menu y el temporizador quedan desactivados.
- Un archivo vacio, con espacios o con [] permite continuar sin descifrar registros.
- Solo Date > fecha requiere respuesta; una fecha de hoy o futura se conserva sin desafio.
- La respuesta se compara con pon mediante SHA3-256 Unicode en Base64, compatible con EncriptacionX.
- Cada registro admite tres intentos por ejecucion. El tercer error muestra SGTD-LIC-003, solicita acceso al ingeniero y llama Application.Terminate al cerrar el mensaje.
- Un acierto elimina la linea correspondiente del mismo archivo, preserva las restantes y continua con el siguiente vencido.
- Al terminar se restaura la visibilidad previa de los controles y el menu. Se conserva el login normal y sus permisos.

## Archivos y errores

Se requiere escritura en dll. Un auxiliar .lock impide validar desde dos instancias simultaneas; se libera al finalizar o destruir el formulario. No eliminarlo durante la ejecucion.

El guardado comprueba cambios externos, escribe un temporal y reemplaza el original mediante MoveFileEx. Los indices en memoria se actualizan despues del guardado. Las lineas restantes conservan sus valores cifrados.

Un archivo ausente, JSON invalido, datos no descifrables, hash inconsistente o fallo de escritura bloquea el acceso. SGTD-LIC-001 identifica errores de carga/bloqueo; SGTD-LIC-002 identifica errores durante la validacion o persistencia. No se crea automaticamente un archivo de licencias vacio.

## Organizacion Clean Code

Los eventos coordinan el flujo. Metodos separados se ocupan del bloqueo, lectura, configuracion AES, descifrado de fechas, seleccion de vencidos, intentos, persistencia e interfaz. La clave AES se deriva una sola vez por carga; el modo y formato se seleccionan por registro. Las constantes de errores e intentos estan centralizadas. El estado del boton se restaura mediante finally.

## Verificacion

Compilacion y enlace correctos con Delphi 10.3, dcc32 33.0, usando las rutas locales de componentes y recursos. Se genero Win32/Debug/SGTD.exe. git diff --check paso. No se ejecuto la aplicacion ni se alteraron licencias existentes durante la revision.

Pruebas funcionales pendientes sobre una copia: archivo vacio y []; fechas futura, actual y vencida; varios vencidos intercalados; dos errores y acierto; tres errores; reinicio tras eliminar; archivo ausente o danado; falta de permisos; segunda instancia; restauracion de controles y permisos del login.

## Limites heredados

El formato incluye pinTexto en texto claro, el PIN cifrado y una clave maestra fija en el codigo. AES CBC/CTR no autentica el documento y la fecha depende del reloj local. No protege frente a manipulacion deliberada del archivo/ejecutable, retroceso del reloj o restauracion de copias. Los intentos se reinician al abrir la aplicacion. Una proteccion mas fuerte requiere migrar generador y verificador a licencias firmadas y definir un estado confiable de intentos y tiempo.
