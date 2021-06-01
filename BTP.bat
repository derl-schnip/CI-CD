@echo off
cls

SET user=alex08021994@tut.by
SET subdomain=91ed9553trial-ga
SET password=Schnip010
SET url=https://cpcli.cf.eu10.hana.ondemand.com

:: Authenticate with SAP BTP
  CALL :login_btp
:: Creation sub-accounts
  CALL :create_subaccount
  EXIT /B %ERRORLEVEL%

:login_btp
  CALL  :log Authentication
  btp login --url %url% --user %user% --subdomain %subdomain% --password %password%
EXIT /B 0

:create_subaccount
  SET name=sub_account
  SET region=eu10
  SET email=alex08021994@tut.by
  SET directory_id=$4
  SET subdomain=91ed9553trias
  CALL :log Sub-Account
  btp create accounts/subaccount --display-name %name% --subdomain %subdomain% --region %region% --subaccount-admins [\"%user%\"]
EXIT /B 0

:log
  echo.
  echo ------- %~1 -------
  echo.
EXIT /B 0
