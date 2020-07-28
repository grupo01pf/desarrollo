USE [msdb]
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado8hs]    Script Date: 28/07/2020 14:13:56 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:13:58 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado8hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:00 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''08:00:00'' and ''08:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''08:00:00'' and ''08:59:00'' and idEstado = 7 
', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoaFinalizado]    Script Date: 28/07/2020 14:14:00 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoaFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''08:00:00'' and ''08:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1)', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'8hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200725, 
		@active_end_date=99991231, 
		@active_start_time=80000, 
		@active_end_time=235959, 
		@schedule_uid=N'e8dc38f6-0b16-419b-9edc-66fce4dcc2cd'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado9hs]    Script Date: 28/07/2020 14:14:01 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:01 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado9hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:02 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''09:00:00'' and ''09:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''09:00:00'' and ''09:59:00'' and idEstado = 7 
', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoAFinalizado]    Script Date: 28/07/2020 14:14:02 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoAFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''09:00:00'' and ''09:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1) ', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'9hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200725, 
		@active_end_date=99991231, 
		@active_start_time=90000, 
		@active_end_time=235959, 
		@schedule_uid=N'08e1b741-aa20-4b07-951b-7bc30f6be6e8'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado10hs]    Script Date: 28/07/2020 14:14:02 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:02 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado10hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:02 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''10:00:00'' and ''10:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''10:00:00'' and ''10:59:00'' and idEstado = 7 
', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoAFinalizado]    Script Date: 28/07/2020 14:14:02 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoAFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''10:00:00'' and ''10:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1) ', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'10hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200725, 
		@active_end_date=99991231, 
		@active_start_time=100000, 
		@active_end_time=235959, 
		@schedule_uid=N'40b43648-114a-4880-ae53-9b54f16cb06d'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado11hs]    Script Date: 28/07/2020 14:14:02 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:02 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado11hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:02 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''11:00:00'' and ''11:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''11:00:00'' and ''11:59:00'' and idEstado = 7 
', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoAFinalizado]    Script Date: 28/07/2020 14:14:02 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoAFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''11:00:00'' and ''11:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1) ', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'11hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200725, 
		@active_end_date=99991231, 
		@active_start_time=110000, 
		@active_end_time=235959, 
		@schedule_uid=N'a13ae1b4-ea8c-4e38-8ab5-794df4f7fba7'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado12hs]    Script Date: 28/07/2020 14:14:02 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:02 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado12hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:02 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''12:00:00'' and ''12:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''12:00:00'' and ''12:59:00'' and idEstado = 7 
', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoAFinalizado]    Script Date: 28/07/2020 14:14:02 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoAFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''12:00:00'' and ''12:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1) ', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'12hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200725, 
		@active_end_date=99991231, 
		@active_start_time=120000, 
		@active_end_time=235959, 
		@schedule_uid=N'6e1a2dcd-87a4-444d-942b-3d506439608f'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado13hs]    Script Date: 28/07/2020 14:14:02 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:02 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado13hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:02 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''13:00:00'' and ''13:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''13:00:00'' and ''13:59:00'' and idEstado = 7 
', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoAFinalizado]    Script Date: 28/07/2020 14:14:02 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoAFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''13:00:00'' and ''13:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1)', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'13hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200725, 
		@active_end_date=99991231, 
		@active_start_time=130000, 
		@active_end_time=235959, 
		@schedule_uid=N'623b4726-32e0-46b9-92e3-3596bfd334da'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado14hs]    Script Date: 28/07/2020 14:14:02 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:02 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado14hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:03 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''14:00:00'' and ''14:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''14:00:00'' and ''14:59:00'' and idEstado = 7 
', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoAFinalizado]    Script Date: 28/07/2020 14:14:03 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoAFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''14:00:00'' and ''14:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1) ', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'14hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200725, 
		@active_end_date=99991231, 
		@active_start_time=140000, 
		@active_end_time=235959, 
		@schedule_uid=N'b15a387a-9642-42a0-b0ee-00af2c103124'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado15hs]    Script Date: 28/07/2020 14:14:03 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:03 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado15hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:03 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''15:00:00'' and ''15:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''15:00:00'' and ''15:59:00'' and idEstado = 7 
', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoAFinalizado]    Script Date: 28/07/2020 14:14:03 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoAFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''15:00:00'' and ''15:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1) ', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'15hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200725, 
		@active_end_date=99991231, 
		@active_start_time=150000, 
		@active_end_time=235959, 
		@schedule_uid=N'ace72b37-abea-4df3-a2e5-4778d855f407'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado16hs]    Script Date: 28/07/2020 14:14:03 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:03 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado16hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:03 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''16:00:00'' and ''16:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''16:00:00'' and ''16:59:00'' and idEstado = 7 
', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoAFinalizado]    Script Date: 28/07/2020 14:14:03 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoAFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''16:00:00'' and ''16:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1) ', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'16hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200725, 
		@active_end_date=99991231, 
		@active_start_time=160000, 
		@active_end_time=235959, 
		@schedule_uid=N'a412c318-fa0a-43a1-9562-269f15de725f'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado17hs]    Script Date: 28/07/2020 14:14:03 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:03 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado17hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:03 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''17:00:00'' and ''17:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''17:00:00'' and ''17:59:00'' and idEstado = 7 
', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoAFinalizado]    Script Date: 28/07/2020 14:14:03 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoAFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''17:00:00'' and ''17:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1)', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'17hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200725, 
		@active_end_date=99991231, 
		@active_start_time=170000, 
		@active_end_time=235959, 
		@schedule_uid=N'eab5df7e-55d2-4bd0-a447-5d28cfd2b1a9'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado18hs]    Script Date: 28/07/2020 14:14:03 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:03 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado18hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:03 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''18:00:00'' and ''18:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''18:00:00'' and ''18:59:00'' and idEstado = 7 
', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoAFinalizado]    Script Date: 28/07/2020 14:14:03 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoAFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''18:00:00'' and ''18:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1)', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'18hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200725, 
		@active_end_date=99991231, 
		@active_start_time=180000, 
		@active_end_time=235959, 
		@schedule_uid=N'61c40557-71e3-4830-b10c-60278c3c9dfe'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado19hs]    Script Date: 28/07/2020 14:14:03 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:03 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado19hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:03 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''19:00:00'' and ''19:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''19:00:00'' and ''19:59:00'' and idEstado = 7 

', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoAFinalizado]    Script Date: 28/07/2020 14:14:03 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoAFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''19:00:00'' and ''19:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1)', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'19hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200725, 
		@active_end_date=99991231, 
		@active_start_time=190000, 
		@active_end_time=235959, 
		@schedule_uid=N'f98ed28c-738e-49f4-b688-82fa5108508c'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado20hs]    Script Date: 28/07/2020 14:14:03 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:03 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado20hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:03 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''20:00:00'' and ''20:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''20:00:00'' and ''20:59:00'' and idEstado = 7 
', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoAFinalizado]    Script Date: 28/07/2020 14:14:03 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoAFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''20:00:00'' and ''20:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1)', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'20hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200725, 
		@active_end_date=99991231, 
		@active_start_time=200000, 
		@active_end_time=235959, 
		@schedule_uid=N'ba4baeab-b42b-4fdf-9d82-6fe337ddbed4'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado21hs]    Script Date: 28/07/2020 14:14:03 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:03 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado21hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:03 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''21:00:00'' and ''21:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''21:00:00'' and ''21:59:00'' and idEstado = 7 
', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoAFinalizado]    Script Date: 28/07/2020 14:14:03 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoAFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''21:00:00'' and ''21:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1)', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'21hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200725, 
		@active_end_date=99991231, 
		@active_start_time=210000, 
		@active_end_time=235959, 
		@schedule_uid=N'1ea25ad4-682a-4ea2-b1fb-3d305992ea8e'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado22hs]    Script Date: 28/07/2020 14:14:03 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:03 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado22hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:04 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''22:00:00'' and ''22:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''22:00:00'' and ''22:59:00'' and idEstado = 7 
', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoAFinalizado]    Script Date: 28/07/2020 14:14:04 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoAFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''22:00:00'' and ''22:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1)', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'22hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200725, 
		@active_end_date=99991231, 
		@active_start_time=220000, 
		@active_end_time=235959, 
		@schedule_uid=N'3e1ce3b5-6279-477e-a3d0-9e31ec9bc333'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado23hs]    Script Date: 28/07/2020 14:14:04 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:04 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado23hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:04 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''23:00:00'' and ''23:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''23:00:00'' and ''23:59:00'' and idEstado = 7 

', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoAFinalizado]    Script Date: 28/07/2020 14:14:04 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoAFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''23:00:00'' and ''23:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1)', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'23hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200725, 
		@active_end_date=99991231, 
		@active_start_time=230000, 
		@active_end_time=235959, 
		@schedule_uid=N'bfd19112-0b1c-4c57-b02e-7a4ff656ea2c'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [CambioEstadoHabilitadoAFinalizado00hs]    Script Date: 28/07/2020 14:14:04 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:04 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'CambioEstadoHabilitadoAFinalizado00hs', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeHabilitadoAEnCurso]    Script Date: 28/07/2020 14:14:04 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeHabilitadoAEnCurso', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''00:00:00'' and ''00:59:00'' and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 3
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''00:00:00'' and ''00:59:00'' and idEstado = 7 
', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [DeEnCursoAFinalizado]    Script Date: 28/07/2020 14:14:04 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'DeEnCursoAFinalizado', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DECLARE @Tabla1 TABLE (id INT)
INSERT INTO @Tabla1 SELECT id
FROM EncuentroDeportivo
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE(), 103),103) and CAST(horaInicio AS TIME) BETWEEN ''00:00:00'' and ''00:59:00'' and idEstado = 3;
WAITFOR DELAY ''02:00:00''
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE id IN (SELECT * FROM @Tabla1)', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'00hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200726, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'ee049362-c304-45bd-8dc4-2c9713a065d0'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

/****** Object:  Job [BarridoGeneral]    Script Date: 28/07/2020 14:14:04 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 28/07/2020 14:14:04 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'BarridoGeneral', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'No description available.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-N4V2H3NE\frugi', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [BarridoGeneral]    Script Date: 28/07/2020 14:14:04 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'BarridoGeneral', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE()-1, 103),103) and idEstado = 8 
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE()-1, 103),103) and idEstado = 7 
UPDATE EncuentroDeportivo 
Set   idEstado = 14
WHERE fechaInicioEncuentro = convert(datetime,CONVERT(varchar(10), GETDATE()-1, 103),103) and idEstado = 3', 
		@database_name=N'HayEquipo', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'2hs', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=1, 
		@freq_subday_interval=0, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20200726, 
		@active_end_date=99991231, 
		@active_start_time=20000, 
		@active_end_time=235959, 
		@schedule_uid=N'd3ab6cb0-cb80-4ee6-9d61-df6a3ef3dc27'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

