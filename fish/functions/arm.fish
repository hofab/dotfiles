function arm --description 'Debug data abort on arm'
    set path_ "/opt/software/Xilinx-ARM-toolchain-2017.2/SDK/2017.2/gnu/arm/lin/bin/arm-xilinx-eabi-objdump"

    if test -f $path_
        if test -f image.bdi
            /opt/software/Xilinx-ARM-toolchain-2017.2/SDK/2017.2/gnu/arm/lin/bin/arm-xilinx-eabi-objdump -DS image.bdi > image.S
        end
    end
end
