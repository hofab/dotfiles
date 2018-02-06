"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTAX HIGHLIGHTING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match wesPrivCtx /privCtx/
autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match wesAnnotate
\ /\/\*\* [\:A-Za-z0-9 \n\r\*\\\/]* \*\*\//
autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match wesWescam /moduleSend\w*/
autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax keyword wesWescam
\ MSG_Q_ID msgQDelete msgQCreate msgQSend msgQReceive
\ moduleAddCmdQ moduleRemoveCmdQ moduleAddCmd moduleGetCmd moduleRemoveCmd
\ moduleAddCmdRespQ moduleRemoveCmdRespQ moduleAddCmdResp moduleAddCmdResp
\ moduleRemoveCmdResp
autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match wesUnimportant
\ /moduleLogError/
autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match wesThis /this/
autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match wesIdentifier /\w\+_t\ze\W/
autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax match wesIdentifier 'rtems_[a-z_]*\( \|(\)'
autocmd BufRead,BufNewFile *.c,*.h,*.cpp syntax keyword wesCSpecial
\ TRUE FALSE
\ UNITY UNITY_FLOAT UNITY_SHIFT
\ UNITY7 UNITY7_FLOAT UNITY7_SHIFT
\ UNITY23 UNITY23_FLOAT UNITY23_SHIFT
\ UNITY_DOUBLE UNITY23_DOUBLE UNITY15_DOUBLE
\ INVALID_SCALED INVALID_SCALED7 INVALID_SCALED15
\ BIT_1 BIT_2 BIT_3 BIT_4 BIT_5 BIT_6 BIT_7 BIT_8
\ BIT_9 BIT_10 BIT_11 BIT_12 BIT_13 BIT_14 BIT_15
\ BIT_A BIT_B BIT_C BIT_D BIT_E BIT_F
\ BIT_16 BIT_17 BIT_18 BIT_19 BIT_20 BIT_21 BIT_22
\ BIT_23 BIT_24 BIT_25 BIT_26 BIT_27 BIT_28 BIT_29
\ BIT_30 BIT_31 BIT_0
\ OK ERROR
