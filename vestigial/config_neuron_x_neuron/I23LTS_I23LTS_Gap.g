// genesis

// Setting the Resistance of the Gap Junction (1/conductance)
float Rgap = 1.0e9	// Ohms (1/Mhos) from Traub 2005 paper

//float	I23LTS_SEPX = 25e-6
//float	I23LTS_SEPY = 25e-6
//float	I23LTS_NX = 5
//float	I23LTS_NY = 5

int i,j,dexN,dexE,dexS,dexW
int conn1dex, conn2dex
float test1, test2
str conn1loc="", conn2loc=""
float globalconnprob=0.0694 //after Traub 2005
float randconn
int jnodedex,inodedex,jnodecalc

echo I23LTS - I23LTS Gap Junctions

for (i=0;i<=(I23LTS_NY-1);i=i+1)
    for (j=0;j<=(I23LTS_NX-1);j=j+1)

        dexN=i-1
        dexE=j+1
        dexS=i+1
        dexW=j-1

        // N
        randconn = { rand 0 1.0 }

        if ({dexN>=0} && {randconn<{globalconnprob}})
            conn1dex=i*I23LTS_NX+j
            conn2dex=(i-1)*I23LTS_NX+j

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            addmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}  RAXIAL {Rgap} Vm
            addmsg /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        if ({dexN==-1} && {randconn<{globalconnprob}} && { {mynode} >= {sqrtNnodes} }) //for nodal edge
            conn1dex=i*I23LTS_NX+j
            conn2dex=(I23LTS_NY-1)*I23LTS_NX+j

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes}} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // NE
        randconn = { rand 0 1.0 }

        if ({dexN>=0} && {dexE<I23LTS_NX} && {randconn<{globalconnprob}})
            conn1dex=i*I23LTS_NX+j
            conn2dex=(i-1)*I23LTS_NX+j+1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            addmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexN==-1} && {randconn<{globalconnprob}} && {dexE<I23LTS_NX} && { {mynode} >= {sqrtNnodes} }) //for nodal edge
            conn1dex=i*I23LTS_NX+j
            conn2dex=(I23LTS_NY-1)*I23LTS_NX+j+1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes}} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        if ({dexN==-1} && {randconn<{globalconnprob}} && {dexE==I23LTS_NX} && { {mynode} >= {sqrtNnodes} } && {jnodedex} < {sqrtNnodes-1}) //for nodal edge corner

            conn1dex=i*I23LTS_NX+j
            conn2dex=(I23LTS_NY-1)*I23LTS_NX

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes} + 1} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes} - 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE==I23LTS_NX} && {dexN>-1} && {randconn<{globalconnprob}} &&{ {jnodedex} < {sqrtNnodes-1} } ) //for nodal edge

            conn1dex=i*I23LTS_NX+j
            conn2dex=(i-1)*I23LTS_NX

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}@{{mynode} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + 1} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc}@{{mynode} - 1} RAXIAL {Rgap} Vm

        end

        // E
        randconn = { rand 0 1.0 }

        if ({dexE<I23LTS_NX} && {randconn<{globalconnprob}})
            conn1dex=i*I23LTS_NX+j
            conn2dex=(i)*I23LTS_NX+j+1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            addmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexE==I23LTS_NX} && {randconn<{globalconnprob}} && { {jnodedex} < {sqrtNnodes-1} }) //for nodal edge

            conn1dex=i*I23LTS_NX+j
            conn2dex=i*I23LTS_NX

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}@{{mynode} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + 1} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc}@{{mynode} - 1} RAXIAL {Rgap} Vm

        end

        // SE
        randconn = { rand 0 1.0 }

        if ({dexE<I23LTS_NX} && {dexS>I23LTS_NY} && {randconn<{globalconnprob}})

            conn1dex=i*I23LTS_NX+j
            conn2dex=(i+1)*I23LTS_NX+j+1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            addmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexE==I23LTS_NX} && {randconn<{globalconnprob}} && {dexS<I23LTS_NY} && { {jnodedex} < {sqrtNnodes-1} }) //for nodal edge

            conn1dex=i*I23LTS_NX+j
            conn2dex=(i+1)*I23LTS_NX

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}@{{mynode} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + 1} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc}@{{mynode} - 1} RAXIAL {Rgap} Vm

        end

        if ({dexS==I23LTS_NY} && {randconn<{globalconnprob}} && {dexE==I23LTS_NX} && { {jnodedex} < {sqrtNnodes-1} }) //for nodal edge corner

            conn1dex=i*I23LTS_NX+j
            conn2dex=0

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes} + 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes} + 1} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes} - 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE<I23LTS_NX} && {dexS==I23LTS_NY} && {randconn<{globalconnprob}} &&{ {mynode} < {{sqrtNnodes}*{sqrtNnodes-1}} } ) //for nodal edge

            conn1dex=i*I23LTS_NX+j
            conn2dex=(j+1)

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes}} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // S
        randconn = { rand 0 1.0 }

        if ({dexS<I23LTS_NY} && {randconn<{globalconnprob}})
            conn1dex=i*I23LTS_NX+j
            conn2dex=(i+1)*I23LTS_NX+j

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            addmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        if ({dexS==I23LTS_NY} && {randconn<{globalconnprob}} && { {mynode} >= {sqrtNnodes}*{sqrtNnodes-1} }) //for nodal edge
            conn1dex=i*I23LTS_NX+j
            conn2dex=j

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes}} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // SW
        randconn = { rand 0 1.0 }

        if ({dexS<I23LTS_NY} && {dexW>=0} && {randconn<{globalconnprob}})
            conn1dex=i*I23LTS_NX+j
            conn2dex=(i+1)*I23LTS_NX+j-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            addmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexE==1} && {randconn<{globalconnprob}} && {dexS<I23LTS_NY} && { {jnodedex} > 0 }) //for nodal edge

            conn1dex=i*I23LTS_NX+j
            conn2dex=(i+2)*I23LTS_NX-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}@{{mynode} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - 1} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc}@{{mynode} + 1} RAXIAL {Rgap} Vm

        end

        if ({dexS==I23LTS_NY} && {randconn<{globalconnprob}} && {dexE==1} && { {jnodedex} > 0 }) //for nodal edge corner

            conn1dex=i*I23LTS_NX+j
            conn2dex=I23LTS_NX-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes} - 1} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes} + 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE>1} && {dexS==I23LTS_NY} && {randconn<{globalconnprob}} &&{ {mynode} < {{sqrtNnodes}*{sqrtNnodes-1}} } ) //for nodal edge

            conn1dex=i*I23LTS_NX+j
            conn2dex=(j-1)

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} + {sqrtNnodes}} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        // W
        randconn = { rand 0 1.0 }

        if ({dexW>=0} && {randconn<{globalconnprob}})
            conn1dex=i*I23LTS_NX+j
            conn2dex=(i)*I23LTS_NX+j-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            addmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm

        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexW==-1} && {randconn<{globalconnprob}} && { {jnodedex} > 0 }) //for nodal edge
            conn1dex=i*I23LTS_NX+j
            conn2dex=(i+1)*I23LTS_NX-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}@{{mynode} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - 1} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc}@{{mynode} + 1} RAXIAL {Rgap} Vm

        end

        // NW
        randconn = { rand 0 1.0 }

        if ({dexW>=0} && {dexN>=0} && {randconn<{globalconnprob}})
            conn1dex=i*I23LTS_NX+j
            conn2dex=(i-1)*I23LTS_NX+j-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            addmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} RAXIAL {Rgap} Vm
            addmsg /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} RAXIAL {Rgap} Vm
        end

        float jnodecalcarg = {mynode}/{sqrtNnodes}

        jnodecalc = {trunc {jnodecalcarg} }

        jnodedex = {mynode} - {sqrtNnodes}*jnodecalc

        if ({dexN==-1} && {randconn<{globalconnprob}} && {dexE>1} && { {mynode} >= {sqrtNnodes} }) //for nodal edge

            conn1dex=i*I23LTS_NX+j
            conn2dex=(I23LTS_NY-1)*I23LTS_NX+j-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes}} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes}} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes}} RAXIAL {Rgap} Vm

        end

        if ({dexN==-1} && {randconn<{globalconnprob}} && {dexE==1} && { {mynode} >= {sqrtNnodes} } && { {jnodedex} > 0 }) //for nodal edge corner

            conn1dex=i*I23LTS_NX+j
            conn2dex=(I23LTS_NY*I23LTS_NX)-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}@{{mynode} - {sqrtNnodes} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - {sqrtNnodes} - 1} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc}@{{mynode} + {sqrtNnodes} + 1} RAXIAL {Rgap} Vm

        end

        if ( {dexE==1} && {dexN>-1} && {randconn<{globalconnprob}} && { {jnodedex} > 0 } ) //for nodal edge

            conn1dex=i*I23LTS_NX+j
            conn2dex=(i)*I23LTS_NX-1

            conn1loc=""
            conn2loc=""

            test1 = { rand 0 8 }
            test2 = { rand 0 8 }

            if ({test1<1})
                conn1loc="distdendNlongf"
            end
            if ({test1>=1} && {test1<2})
                conn1loc="distdendNlongg"
            end
            if ({test1>=2} && {test1<3})
                conn1loc="distdendElongf"
            end
            if ({test1>=3} && {test1<4})
                conn1loc="distdendElongg"
            end
            if ({test1>=4} && {test1<5})
                conn1loc="distdendSlongf"
            end
            if ({test1>=5} && {test1<6})
                conn1loc="distdendSlongg"
            end
            if ({test1>=6} && {test1<7})
                conn1loc="distdendWlongf"
            end
            if ({test1>=7} && {test1<=8})
                conn1loc="distdendWlongg"
            end

            if ({test2<1})
                conn2loc="distdendNlongf"
            end
            if ({test2>=1} && {test2<2})
                conn2loc="distdendNlongg"
            end
            if ({test2>=2} && {test2<3})
                conn2loc="distdendElongf"
            end
            if ({test2>=3} && {test2<4})
                conn2loc="distdendElongg"
            end
            if ({test2>=4} && {test2<5})
                conn2loc="distdendSlongf"
            end
            if ({test2>=5} && {test2<6})
                conn2loc="distdendSlongg"
            end
            if ({test2>=6} && {test2<7})
                conn2loc="distdendWlongf"
            end
            if ({test2>=7} && {test2<=8})
                conn2loc="distdendWlongg"
            end        

            raddmsg /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc}@{{mynode} - 1} RAXIAL {Rgap} Vm
            raddmsg@{{mynode} - 1} /I23LTSnet/I23LTS[{conn2dex}]/{conn2loc} /I23LTSnet/I23LTS[{conn1dex}]/{conn1loc}@{{mynode} + 1} RAXIAL {Rgap} Vm

        end

    end
end

