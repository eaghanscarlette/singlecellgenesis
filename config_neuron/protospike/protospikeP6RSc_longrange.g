// genesis

/* FILE INFORMATION
**
**  Function to create prototype "spikegen" element "spike"
**  with unit amplitude and 0.010 second refractory period
**
**  GENESIS 2.0
*/

function make_spk13longrange
        if ({exists spk13longrange})
                return
        end

        create spikegen spk13longrange
        setfield spk13longrange \
                thresh  0.00 \         // V
                abs_refract     10e-3 \ // sec
                output_amp      1
end
