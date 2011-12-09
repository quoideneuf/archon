--Drop RequireSecureConnection from Users table
DECLARE @defname VARCHAR(100), @cmd VARCHAR(1000); SET @defname = (SELECT name FROM sysobjects so JOIN sysconstraints sc ON so.id = sc.constid WHERE object_name(so.parent_obj) = 'tblCore_Users' AND so.xtype = 'D' AND sc.colid = (SELECT colid FROM syscolumns WHERE id = object_id('tblCore_Users') AND name = 'RequireSecureConnection')); SET @cmd = 'ALTER TABLE tblCore_Users DROP CONSTRAINT ' + @defname; IF EXISTS((SELECT name FROM sysobjects so JOIN sysconstraints sc ON so.id = sc.constid WHERE object_name(so.parent_obj) = 'tblCore_Users' AND so.xtype = 'D' AND sc.colid = (SELECT colid FROM syscolumns WHERE id = object_id('tblCore_Users') AND name = 'RequireSecureConnection')))EXEC(@cmd);
ALTER TABLE tblCore_Users DROP COLUMN RequireSecureConnection;