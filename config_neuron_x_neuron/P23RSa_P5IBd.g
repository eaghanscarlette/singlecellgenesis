// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {P23RSa_P5IBd_destlim}

/*
 * Usage :
 * volumeconnect source-path destination-path
 *		 [-relative]
 *		 [-sourcemask {box,ellipse} x1 y1 x2 y2]
 *		 [-sourcehole {box,ellipse} x1 y1 x2 y2]
 *		 [-destmask   {box,ellipse} x1 y1 x2 y2]
 *		 [-desthole   {box,ellipse} x1 y1 x2 y2]
 *		 [-probability p]
 */

echo Making connections from the P23RSa cells to the P5IBd cells.


//P23RSa - P5IBd AMPA

str s

//Load synapse location array

str locations = "apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12"

foreach s ({arglist {locations}})

    rvolumeconnect /P23RSanet/P23RSa[]/soma/spk1  \
	      /P5IBdnet/P5IBd[]/{s}/Ex_ch9P23RSAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability 0.12500*{P23RSa_P5IBd_prob}

end

//P23RSa - P5IBd NMDA

str s

//Load synapse location array

str locations = "apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12"

foreach s ({arglist {locations}})

    rvolumeconnect /P23RSanet/P23RSa[]/soma/spk1  \
	      /P5IBdnet/P5IBd[]/{s}/Ex_ch9P23RSNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1  {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability 0.12500*{P23RSa_P5IBd_prob}

end

echo Setting weights and delays for P23RSa->P5IBd connections.

// assigning delays using the volumedelay function

/* 
 * Usage :
 * volumedelay path 
 * [-fixed delay]
 * [-radial propagation_velocity] 
 * [-uniform range]   (not used here)
 * [-gaussian sd max] (not used here)
 * [-exp mid max]     (not used here)
 * [-absoluterandom]  (not used here)
 */

rvolumedelay /P23RSanet/P23RSa[]/soma/spk1 -radial  {P23RSa_P5IBd_axdelayCV} -add -gaussian {P23RSa_P5IBd_axdelaystdev} {P23RSa_P5IBd_axdelaymaxdev}

//P23RSa - P5IBd AMPA

str s

//Load synapse location array

str locations = "apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12"

foreach s ({arglist {locations}})

    syndelay    /P5IBdnet/P5IBd[]/{s}/Ex_ch9P23RSAMPA {P23RSa_P5IBd_syndelay} -add -gaussian {P23RSa_P5IBd_syndelaystdev} {P23RSa_P5IBd_syndelaymaxdev}

end

//P23RSa - P5IBd NMDA

str s

//Load synapse location array

str locations = "apdend5 apdend6 apdend7 apdend8 apdend9 apdend10 apdend11 apdend12"

foreach s ({arglist {locations}})

    syndelay    /P5IBdnet/P5IBd[]/{s}/Ex_ch9P23RSNMDA {P23RSa_P5IBd_syndelay} -add -gaussian {P23RSa_P5IBd_syndelaystdev} {P23RSa_P5IBd_syndelaymaxdev}

end

// assigning weights using the volumeweight function

/* 
 * Usage :
 *  volumeweight sourcepath 
 *          [-fixed weight]
 *          [-decay decay_rate max_weight min_weight]
 *          [-uniform range] 
 *          [-gaussian sd max] 
 *          [-exponential mid max]
 *          [-absoluterandom]
 */

rvolumeweight /P23RSanet/P23RSa[]/soma/spk1 -decay {P23RSdecayrate} {P23RSmaxwgt} {P23RSminwgt}




