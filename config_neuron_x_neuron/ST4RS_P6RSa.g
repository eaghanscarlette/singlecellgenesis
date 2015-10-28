// genesis

// Setting the axonal propagation velocity
float CABLE_VEL = 1	// scale factor = 1/(cable velocity) sec/meter

float destlim = {ST4RS_P6RSa_destlim}

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

echo Making connections from the ST4RS cells to the P6RSa cells.


//ST4RS - P6RSa AMPA

str s

//Load synapse location array

str locations = "apdend3 apdend4 apdend5 apdend6 apdend7"

foreach s ({arglist {locations}})

    rvolumeconnect /ST4RSnet/ST4RS[]/soma/spk17  \
	      /P6RSanet/P6RSa[]/{s}/Ex_ch11ST4RSAMPA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability 0.200*{ST4RS_P6RSa_prob}

end

//ST4RS - P6RSa NMDA

str s

//Load synapse location array

str locations = "apdend3 apdend4 apdend5 apdend6 apdend7"

foreach s ({arglist {locations}})

    rvolumeconnect /ST4RSnet/ST4RS[]/soma/spk17  \
	      /P6RSanet/P6RSa[]/{s}/Ex_ch11ST4RSNMDA@all	    \
	      -relative			    \
	      -sourcemask box -1 -1  -1  1  1  1   \
	      -destmask   box -{destlim} -{destlim}  -1 {destlim}  {destlim}  1   \
	      -desthole   box -0.000001 -0.000001 -0.000001 0.000001 0.000001 0.000001 \
          -probability 0.200*{ST4RS_P6RSa_prob}

end

echo Setting weights and delays for ST4RS->P6RSa connections.

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

rvolumedelay /ST4RSnet/ST4RS[]/soma/spk17 -radial  {ST4RS_P6RSa_axdelayCV} -add -gaussian {ST4RS_P6RSa_axdelaystdev} {ST4RS_P6RSa_axdelaymaxdev}

//ST4RS - P6RSa AMPA

str s

//Load synapse location array

str locations = "apdend3 apdend4 apdend5 apdend6 apdend7"

foreach s ({arglist {locations}})

    syndelay    /P6RSanet/P6RSa[]/{s}/Ex_ch11ST4RSAMPA {ST4RS_P6RSa_syndelay} -add -gaussian {ST4RS_P6RSa_syndelaystdev} {ST4RS_P6RSa_syndelaymaxdev}

end

//ST4RS - P6RSa NMDA

str s

//Load synapse location array

str locations = "apdend3 apdend4 apdend5 apdend6 apdend7"

foreach s ({arglist {locations}})

    syndelay    /P6RSanet/P6RSa[]/{s}/Ex_ch11ST4RSNMDA {ST4RS_P6RSa_syndelay} -add -gaussian {ST4RS_P6RSa_syndelaystdev} {ST4RS_P6RSa_syndelaymaxdev}

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

rvolumeweight /ST4RSnet/ST4RS[]/soma/spk17 -decay {ST4RSdecayrate} {ST4RSmaxwgt} {ST4RSminwgt}




