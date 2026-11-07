# Revision de codificacion de SGTD

Alcance: las 17 unidades distintas incluidas en SGTD.dpr y sus formularios; consultas SQL del proyecto y del despliegue Win32/Debug; configuracion de login, About y conexion MyDAC. Se excluyen proyectos independientes y copias fuera del programa.

Resultados: fuentes y formularios UTF-8 validos; 43 SQL del proyecto y 44 SQL desplegados UTF-8 validos. Las operaciones activas de lectura/escritura de texto revisadas indican UTF-8; las lecturas sin encoding encontradas en SCOAlta pertenecen a un bloque comentado. No se encontraron conversiones explicitas AnsiString/PAnsiChar en las unidades activas. MyConnection1 tiene Options.UseUnicode=True. RG y RG_historico aplican UTF-8 a las exportaciones de texto y XML mediante OnBeginExport.

Correcciones: las consultas de Reportearchivar, RG_historico y scoconsultas que buscaban co.sql, coh1.sql y cox.sql en la raiz ahora apuntan a sql. RG_historico usa cohist1.sql en lugar del inexistente cohist_1.sql. Todas las rutas SQL literales corregidas existen junto al ejecutable de Debug.

## Unidades revisadas

| Unidad | Operaciones de texto con UTF-8 verificadas |
| --- | ---: |
| main.pas | 7 |
| d_m.pas | 0 |
| login.pas | 2 |
| Forms/SCOAlta.pas | 3 |
| Forms/scoage_alta.pas | 0 |
| Forms/about.pas | 1 |
| Forms/RG.pas | 3 |
| Forms/sco_aux_impresion.pas | 0 |
| Forms/rg_1.pas | 0 |
| Forms/scoage_bus.pas | 0 |
| Forms/sco_cat_grupo.pas | 0 |
| Forms/config.pas | 0 |
| Forms/Reportearchivar.pas | 4 |
| Forms/RG_historico.pas | 6 |
| Forms/SCO_auxiliar_alta_edicion.pas | 0 |
| Forms/sco_age_aux.pas | 0 |
| Forms/scoconsultas.pas | 5 |

Los modulos sin operaciones de texto no leen ni guardan documentos mediante las llamadas revisadas. Las imagenes se verificaron como operaciones binarias y no se les aplicaron conversiones de codificacion.

## Limites

Revision estatica y de archivos locales. No se modificaron datos ni codificaciones del servidor MySQL. Las conexiones, datos reales, impresiones y exportaciones requieren prueba funcional en la aplicacion. Una compilacion correcta no demuestra todos los recorridos de ejecucion.

## Compilacion

Compilacion y enlace correctos con Delphi 10.3 (dcc32 33.0). El ejecutable verificado se genero en tmp/verificacion_utf8/SGTD.exe porque no se pudo reemplazar Win32/Debug/SGTD.exe durante la revision. No ejecutar la copia temporal sin desplegar sus recursos. Cerrar la aplicacion y recompilar en Delphi para actualizar el ejecutable habitual. git diff --check sin errores.
