function ical --description 'Copy all relevant data for inner call'
    set oPath (pwd)
    set date_ (date -I)
    set time_ (date +"%H%M")
    set folder "mx15_ia_cal_"$date_$time_
    set path_ $HOME"/shared/IA_CAL/"$folder

    echo $path_
    mkdir -p $path_
#    cp ~/release/gimbalPositionSensors.c $path_
#    cp ~/release/gimbalCtrl.c $path_
#    cp ~/maint/ia_cal_mod.sc $path_
    mv ~/maint/mx15_ia_cal.log $path_
    mv ~/maint/mx15_ia_cal_results.log $path_
    mv ~/maint/mx15_initial_state.log $path_
#    mv ~/maint/test.log $path_
#    mv ~/maint/test_1.log $path_
    cd $path_
    if test -f test_1.log
        cp test_1.log back_1.log; and sed -i -e '/^[^J]/d' test_1.log; and sed -i -e '/^[[:space:]]*$/d' test_1.log; and sed -i -e 's/^J.*>//g' test_1.log
        mv test_1.log data_AZ.log
        mv back_1.log rawdata_AZ.log
    end
    if test -f test.log
        cp test.log back.log; and sed -i -e '/^[^J]/d' test.log; and sed -i -e '/^[[:space:]]*$/d' test.log; and sed -i -e 's/^J.*>//g' test.log
        mv test.log data_EL.log
        mv back.log rawdata_EL.log
    end
    exa -l $path_
    cd $oPath
end
