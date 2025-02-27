--------------------------------------------------------------------------------
-- ODS Data - 693500 - SME Banking Loan Origination System - Drop#1
--------------------------------------------------------------------------------

-- ALC
DECLARE
  V_MAX_EVNT  VARCHAR2(10);
BEGIN

	--------------------------------------------------------------------------------------------------
	SELECT MAX(TO_NUMBER(NTFCN_EVNT.NE_ID)) INTO V_MAX_EVNT FROM NTFCN_EVNT;
	
	--------------------------------------------------------------------------------------------------
	--ICORPSMEFNC --FNCREQDOCUPLD -- SMS: required details and upload the document under bank’s website 
	--------------------------------------------------------------------------------------------------
	INSERT INTO NTFCN_EVNT (NE_ID, NE_TYPE, NE_SUB_TYPE, NE_DESCRIPTION_EN, NE_DESCRIPTION_AR, NE_MANDATORY_FLAG, NE_ENABLED_FLAG, NE_SPECIFIC_CUSTOMERS_FLAG, NE_DFLT_SGN, NE_PRIORITY, NE_APPLY_PRFL_AMT, NE_APPLY_PRFL_ENBLD, NE_APPLCN_MODULE, NE_MANDATORY_CHNL, NE_CATEGORY)
	VALUES (V_MAX_EVNT+1, 'ICORPSMEFNC', 'FNCREQDOCUPLD', 'Req Details And Upld The Doc For SME Banking Loan', 'Req Details And Upld The Doc For SME Banking Loan', 'Y', 'Y', 'N', '+', '5', 'Y', 'Y', 'ICORP', 'CLOS', '');
	--TMPLT
	INSERT INTO TEMPLATES (T_CODE, T_SUBJECT_EN, T_SUBJECT_AR, T_TEXT_EN, T_TEXT_AR, T_ATTACHMENT, T_EMAIL_FROM, T_GATEWAY)
	VALUES ('FNCREQDOCUPLD', '', '', '', '', '', '', 'FNCREQDOCUPLD'); 
	--MTHD
	INSERT INTO NTFCN_EVNT_MTHD (NEM_NE_ID, NEM_NM_ID, NEM_SEGEMENT_CD, NEM_FEES, NEM_ENABLED_FLAG, NEM_TEMPLATE_CD, NEM_RECIPIENT_TYPE, NEM_EMAIL_TO, NEM_TRACK_DELIVERY)
	VALUES (V_MAX_EVNT+1, '1', '0', '', 'Y', 'FNCREQDOCUPLD', 'CUSTOMER', '', 'N'); 
	 
	INSERT INTO NTFCN_EVNT_MTHD (NEM_NE_ID, NEM_NM_ID, NEM_SEGEMENT_CD, NEM_FEES, NEM_ENABLED_FLAG, NEM_TEMPLATE_CD, NEM_RECIPIENT_TYPE, NEM_EMAIL_TO, NEM_TRACK_DELIVERY)
	VALUES (V_MAX_EVNT+1, '2', '0', '', 'Y', 'FNCREQDOCUPLD', 'CUSTOMER', '', 'N'); 
	--------------------------------------------------------------------------------------------------
	
	--------------------------------------------------------------------------------------------------
	--ICORPSMEFNC --FNCREQREJCOMMRM --Req has been rejected, please communicate with RM.
	--------------------------------------------------------------------------------------------------
	INSERT INTO NTFCN_EVNT (NE_ID, NE_TYPE, NE_SUB_TYPE, NE_DESCRIPTION_EN, NE_DESCRIPTION_AR, NE_MANDATORY_FLAG, NE_ENABLED_FLAG, NE_SPECIFIC_CUSTOMERS_FLAG, NE_DFLT_SGN, NE_PRIORITY, NE_APPLY_PRFL_AMT, NE_APPLY_PRFL_ENBLD, NE_APPLCN_MODULE, NE_MANDATORY_CHNL, NE_CATEGORY)
	VALUES (V_MAX_EVNT+2, 'ICORPSMEFNC', 'FNCREQREJCOMMRM', 'Req hs ben rjctd for SME Bnkng Loan,pls com wth RM', 'Req hs ben rjctd for SME Bnkng Loan,pls com wth RM', 'Y', 'Y', 'N', '+', '5', 'Y', 'Y', 'ICORP', 'CLOS', '');
	--TMPLT
	INSERT INTO TEMPLATES (T_CODE, T_SUBJECT_EN, T_SUBJECT_AR, T_TEXT_EN, T_TEXT_AR, T_ATTACHMENT, T_EMAIL_FROM, T_GATEWAY)
	VALUES ('FNCREQREJCOMMRM', '', '', '', '', '', '', 'FNCREQREJCOMMRM'); 
	--MTHD
	INSERT INTO NTFCN_EVNT_MTHD (NEM_NE_ID, NEM_NM_ID, NEM_SEGEMENT_CD, NEM_FEES, NEM_ENABLED_FLAG, NEM_TEMPLATE_CD, NEM_RECIPIENT_TYPE, NEM_EMAIL_TO, NEM_TRACK_DELIVERY)
	VALUES (V_MAX_EVNT+2, '1', '0', '', 'Y', 'FNCREQREJCOMMRM', 'CUSTOMER', '', 'N');  
	--------------------------------------------------------------------------------------------------

	
	COMMIT;
	--------------------------------------------------------------------------------------------------
END;


