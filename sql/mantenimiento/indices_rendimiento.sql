-- SGTD: ejecutar en la base seleccionada por la aplicacion.
-- Indices NO unicos: no cambian datos, claves primarias ni AUTO_INCREMENT.
-- La comprobacion por nombre permite repetir este archivo.
-- En MyISAM, crear indices puede bloquear temporalmente la tabla.

SET @sgtd_sql = IF(
  EXISTS(SELECT 1 FROM information_schema.STATISTICS
    WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='co' AND INDEX_NAME='idx_sgtd_co_id'),
  'SELECT 1', 'CREATE INDEX idx_sgtd_co_id ON co (id)');
PREPARE sgtd_stmt FROM @sgtd_sql;
EXECUTE sgtd_stmt;
DEALLOCATE PREPARE sgtd_stmt;

SET @sgtd_sql = IF(
  EXISTS(SELECT 1 FROM information_schema.STATISTICS
    WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='co' AND INDEX_NAME='idx_sgtd_co_archivo_id'),
  'SELECT 1', 'CREATE INDEX idx_sgtd_co_archivo_id ON co (archivo, id)');
PREPARE sgtd_stmt FROM @sgtd_sql;
EXECUTE sgtd_stmt;
DEALLOCATE PREPARE sgtd_stmt;

SET @sgtd_sql = IF(
  EXISTS(SELECT 1 FROM information_schema.STATISTICS
    WHERE TABLE_SCHEMA=DATABASE() AND TABLE_NAME='age' AND INDEX_NAME='idx_sgtd_age_id'),
  'SELECT 1', 'CREATE INDEX idx_sgtd_age_id ON age (id_age)');
PREPARE sgtd_stmt FROM @sgtd_sql;
EXECUTE sgtd_stmt;
DEALLOCATE PREPARE sgtd_stmt;
