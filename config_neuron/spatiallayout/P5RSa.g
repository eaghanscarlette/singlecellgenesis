// genesis

// Arranging the P5RSa cells in space.

echo Creating P5RSa network

//float	P5RSa_SEPX = 25e-6
//float	P5RSa_SEPY = 25e-6
//float	P5RSa_NX = 5
//float	P5RSa_NY = 5

float originxmin
float originymin

// Unique number for each cell type (same as spike number)
int typenum = 23

int ydex
float placer

float randzpos
int i,j
int k = 0

placer = {mynode}/{sqrtNnodes}

//echo placer= {placer}

ydex = { round {placer} }

//echo ydex= {ydex}

originxmin = ({mynode}-{ydex}*sqrtNnodes)*P5RSa_NX*P5RSa_SEPX

//echo originxmin= {originxmin}

originymin = {ydex}*P5RSa_NY*P5RSa_SEPY

//echo originymin= {originymin}

create neutral /P5RSanet

// Random orientation
float randrotation
addfield /P5RSa rotation

// CREATING THE PLANE OF P5RSa cells
//createmap /P5RSa /P5RSanet  \
//	{P5RSa_NX} {P5RSa_NY} \
//	-delta {P5RSa_SEPX} {P5RSa_SEPY} \
//	-origin {originxmin} {originymin}

// Note that these cells' positions overlap.  This doesn't cause any
// problems since we can refer to them as separate groups.

for (j = 0; j < P5RSa_NY; j = j+1)
     for (i = 0; i < P5RSa_NX; i = i+1)

          int newrandseed = {{ {typenum} @0@ {trunc {{{originxmin}+{P5RSa_SEPX}*{i}}/{SEPX}}} @0@ {trunc {{{originymin}+{P5RSa_SEPY}*{j}}/{SEPY}}} } + {myrandseed}}
          randseed {newrandseed}
          randzpos = { rand 550e-6 1262e-6 }

          copy /P5RSa /P5RSanet/P5RSa[{k}]
          position /P5RSanet/P5RSa[{k}] \
            {originxmin + P5RSa_SEPX*i} {originymin + P5RSa_SEPY*j} {randzpos}

          // Rotate about z-axis ("twirl" in GENESIS cellsheet terminology)
          if ({rotateneurons} == 1)
              randrotation = {rand 0 6.283185308 }
              setfield /P5RSanet/P5RSa[{k}] rotation {randrotation} // save for posterity
              rotcoord /P5RSanet/P5RSa[{k}] {randrotation} -z -center {originxmin + P5RSa_SEPX*i} {originymin + P5RSa_SEPY*j} {randzpos}
          end

          k=k+1

          echo Position P5RSa {mynode} {i} {j} {originxmin} {originymin} {originxmin + P5RSa_SEPX*i} {originymin + P5RSa_SEPY*j} {randzpos}

     end
end
