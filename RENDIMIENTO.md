# Revision de apertura y rendimiento de SGTD

## Alcance

Se revisaron las 17 unidades del programa (16 formularios y d_m), sus eventos de creacion y sus puntos activos de Show/ShowModal. Se excluyeron EncriptacionX, SCO_2024_octubre y las copias fuera del proyecto SGTD. No se modificaron registros ni la estructura de MySQL.

## Cambios principales

- Oficios/Altas/BitBtn3 y el menu de reportes comparten PrepararApertura. La ventana se pinta antes de consultar; la seleccion devuelve mrOk y se reinicia el folio al abrir. Cancelar no reutiliza la seleccion anterior.
- Altas muestra un panel de carga antes de preparar TCO y catalogos. El temporizador de apertura se cancela al ocultarse; los temporizadores de estado funcionan solo mientras corresponde.
- Se eliminan Refresh completos al volver de la seleccion de oficio/contacto y el recorrido manual First/Next/Last de la agenda. Se conserva Locate; MyDAC puede recuperar mas filas para localizar registros que aun no estan en memoria.
- El login abre solo catalogos pequenos. Los datasets grandes de oficios, agenda, busquedas, reportes e impresion se abren cuando se necesitan. Se eliminan las dos descargas adicionales y sus Last al cerrar el login.
- Se reutilizan las instancias ya creadas de busquedas, catalogos e impresion. No quedan construcciones activas de formularios adicionales por pulsacion de boton. SGTD.dpr ya no crea dos veces las ventanas de busqueda de agenda y consultas.
- Los datasets de consultas grandes recuperan bloques de 50 mediante FetchAll=False. No se introduce un LIMIT ni se pierde acceso al resto de los registros. Se eliminan Last de las consultas automaticas de los reportes; se conserva Last en la navegacion explicita y en flujos existentes de alta.
- Las busquedas de texto esperan 300 ms tras la ultima pulsacion. Al mostrar un buscador se programa la consulta inicial para despues de pintar. Los temporizadores pendientes se cancelan al ocultar las ventanas.
- Las dos busquedas de agenda comparten una consulta parametrizada, con soporte para apostrofes y Unicode. Sus selecciones se toman de la instancia visible.
- Los cambios encadenados de los combos de tipo/clase quedan agrupados: un solo cambio produce una sola consulta en los tres reportes.
- Los reportes ya no ejecutan una consulta de QImpresion que sus pipelines no utilizan al modificar filtros. Se suspenden los controles enlazados mientras se reconstruyen las consultas.
- Los once JPEG embebidos de siete formularios eran identicos. Se conserva el JPEG original una sola vez en ImagenesReportes.res y se asigna al imprimir. Se mantienen los logotipos externos ya configurados. La prueba comprueba los once componentes sin enviar trabajos a la impresora.

## Aperturas revisadas

| Unidad | Tratamiento |
| --- | --- |
| main | Reutiliza ventanas y delega la carga del reporte; no precarga oficios al terminar login. |
| login | Solo abre catalogos comunes; la conexion sigue siendo explicita. |
| SCOAlta | Apertura tras el primer pintado; BitBtn3 sin descarga duplicada ni Refresh completo; reutiliza auxiliares e impresion. |
| scoage_alta | Reutiliza la ventana; seleccion sin barrido manual; no recarga toda la agenda despues de imprimir. |
| RG | Entrada comun desde menu/Altas; consulta diferida, filtros agrupados y una sola consulta por cambio de combo. |
| RG_historico | Consulta inicial tras pintar; sin Last automatico ni consulta de impresion redundante. |
| Reportearchivar | Consulta inicial tras pintar; sin Last automatico ni consulta de impresion redundante. |
| scoconsultas | Consulta unificada y parametrizada; evita la recursion entre filtros y el Last automatico. |
| scoage_bus | Instancia reutilizada, busqueda diferida y seleccion con mrOk. |
| sco_age_aux | Instancia reutilizada, busqueda diferida y datos tomados de la instancia visible. |
| SCO_auxiliar_alta_edicion | Reutiliza la ventana, agrupa la carga de listas y evita consultas durante la preparacion. |
| sco_cat_grupo | Reutiliza la ventana; elimina la segunda consulta debida a construirla otra vez. |
| sco_aux_impresion | Reutiliza el formulario y carga el logotipo compartido al imprimir. |
| config | Imagenes cargadas una sola vez; temporizador detenido cuando esta oculta. |
| about | Ya alterna textos en una instancia; no se detectaron consultas de base al abrir. |
| rg_1 | Vista enlazada ligera, sin consultas propias ni nuevas instancias al abrir. |
| d_m | Recuperacion progresiva y consulta comun de agenda con parametros. |

## Evidencia de la base actual

La inspeccion de solo lectura encontro tablas MyISAM sin indices: co con 45638 filas y age con 25875 filas. EXPLAIN muestra ALL y Using filesort para la seleccion ordenada de oficios. Incluso buscar por id recorre co completa.

Se preparo sql/mantenimiento/indices_rendimiento.sql con tres indices NO unicos: co(id), co(archivo,id) y age(id_age). NO se ejecuto: requiere autorizacion para cambiar la estructura de la base; en MyISAM su creacion puede bloquear temporalmente las tablas. No agrega claves primarias, restricciones de unicidad ni AUTO_INCREMENT.

Una prueba de RefreshRecord devolvio mas de una fila. Por eso se retiro ese nuevo refresco de la ruta de seleccion y no se asumio que id sea unico. No se corrigieron ni eliminaron registros de la base.

## Comprobaciones realizadas

- Compilacion y enlace correctos con Delphi 10.3, dcc32 33.0. Se genero el ejecutable habitual Win32/Debug/SGTD.exe al finalizar; no es necesario copiar la version temporal.
- tests/AperturaSinConexion.dpr construye todos los formularios, verifica que no abran conexion ni datasets, comprueba la recuperacion progresiva y carga los once logotipos desde el recurso compartido sin imprimir.
- Con -base-solo-lectura usa la configuracion local, configura los datasets del proceso de prueba como ReadOnly y prueba consultas, seleccion, filtros con apostrofe/Unicode y los tres combos de reportes. No imprime ni llama Insert, Edit, Post o ExecSQL.
- La prueba cuenta BeforeOpen y confirma una sola apertura por cambio de combo en RG, RG_historico y Reportearchivar.
- Ultima ejecucion: construccion local 1468 ms; preparacion de Altas 843 ms; apertura progresiva de reporte 703 ms; carga completa de las 45638 filas 1094 ms; busqueda inicial de agenda menos de un tick del reloj.
- Los tiempos variaron entre ejecuciones: no son una garantia de latencia ni una comparacion integral antes/despues. El recurso compartido y la eliminacion de consultas repetidas se verificaron directamente. git diff --check paso.

## Compilacion del recurso

ImagenesReportes.res se incluye junto con su fuente ImagenesReportes.rc y recursos/logo_reportes.jpg. Si se cambia el logotipo, regenerar desde la raiz del proyecto:

    brcc32 "-foImagenesReportes.res" ImagenesReportes.rc

## Limites y validacion visual

La carga se difiere hasta despues del primer pintado, pero las consultas siguen ejecutandose en el hilo VCL: no se comparte una conexion entre hilos ni se introducen consultas paralelas. Su tiempo depende de MySQL, el volumen y los indices. Imprimir o exportar un conjunto completo sigue requiriendo recorrerlo.

Falta comprobar visualmente la apertura, cancelacion/seleccion, navegacion, altas/edicion y previews/exportaciones en la sesion habitual del usuario. La prueba automatizada fue de construccion y lectura; no escribio ni borro registros.
