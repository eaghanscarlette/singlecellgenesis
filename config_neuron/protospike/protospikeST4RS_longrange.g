// genesis

/* FILE INFORMATION
**
**  Function to create prototype "spikegen" element "spike"
**  with unit amplitude and 0.010 second refractory period
**
**  GENESIS 2.0
*/

function make_spk17longrange
        if ({exists spk17longrange})
                return
        end

        create spikegen spk17longrange
        setfield spk17longrange \
                thresh  0.00 \         // V
                abs_refract     10e-3 \ // sec
                output_amp      1
end
