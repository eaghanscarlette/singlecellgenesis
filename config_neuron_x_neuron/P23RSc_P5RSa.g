// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P23RSc_P5RSa_destlim}

/*
 * Usage :
 * planarconnect source-path destination-path
 *		 [-relative]
 *		 [-sourcemask {box,ellipse} x1 y1 x2 y2]
 *		 [-sourcehole {box,ellipse} x1 y1 x2 y2]
 *		 [-destmask   {box,ellipse} x1 y1 x2 y2]
 *		 [-desthole   {box,ellipse} x1 y1 x2 y2]
 *		 [-probability p]
 */

echo Making connections from the P23RSc cells to the P5RSa cells.


//P23RSc - P5RSa AMPA

str s

//Load synapse location array

str locations = "apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12"

foreach s ({arglist {locations}})

    rvolumeconnect /P23RScnet/P23RSc[]/soma/spk3  \
	      /P5RSanet/P5RSa[]/{s}/Ex_ch23P23RSAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability 0.12500*{P23RSc_P5RSa_prob}

end

//P23RSc - P5RSa NMDA

str s

//Load synapse location array

str locations = "apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12"

foreach s ({arglist {locations}})

    rvolumeconnect /P23RScnet/P23RSc[]/soma/spk3  \
	      /P5RSanet/P5RSa[]/{s}/Ex_ch23P23RSNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability 0.12500*{P23RSc_P5RSa_prob}

end

echo Setting weights and delays for P23RSc->P5RSa connections.

// assigning delays using the planardelay function

/* 
 * Usage :
 * planardelay path 
 * [-fixed delay]
 * [-radial propagation_velocity] 
 * [-uniform range]   (not used here)
 * [-gaussian sd max] (not used here)
 * [-exp mid max]     (not used here)
 * [-absoluterandom]  (not used here)
 */

rvolumedelay /P23RScnet/P23RSc[]/soma/spk3 -radial  {P23RSc_P5RSa_axdelayCV} -add -gaussian {P23RSc_P5RSa_axdelaystdev} {P23RSc_P5RSa_axdelaymaxdev}

//P23RSc - P5RSa AMPA

str s

//Load synapse location array

str locations = "apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12"

foreach s ({arglist {locations}})

    syndelay    /P5RSanet/P5RSa[]/{s}/Ex_ch23P23RSAMPA {P23RSc_P5RSa_syndelay} -add -gaussian {P23RSc_P5RSa_syndelaystdev} {P23RSc_P5RSa_syndelaymaxdev}

end

//P23RSc - P5RSa NMDA

str s

//Load synapse location array

str locations = "apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12"

foreach s ({arglist {locations}})

    syndelay    /P5RSanet/P5RSa[]/{s}/Ex_ch23P23RSNMDA {P23RSc_P5RSa_syndelay} -add -gaussian {P23RSc_P5RSa_syndelaystdev} {P23RSc_P5RSa_syndelaymaxdev}

end

// assigning weights using the planarweight function

/* 
 * Usage :
 *  planarweight sourcepath 
 *          [-fixed weight]
 *          [-decay decay_rate max_weight min_weight]
 *          [-uniform range] 
 *          [-gaussian sd max] 
 *          [-exponential mid max]
 *          [-absoluterandom]
 */

rvolumeweight /P23RScnet/P23RSc[]/soma/spk3 -decay {P23RSdecayrate} {P23RSmaxwgt} {P23RSminwgt}




