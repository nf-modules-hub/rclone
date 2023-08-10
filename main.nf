#!/usr/bin/env nextflow

include { COPY } from "./modules/nf-modules-hub/copy"


/*
#==============================================
rclone
#==============================================
*/

workflow RCLONE {

    if( params.samplesheet ) {

        ch_in_copy = Channel.fromPath( params.samplesheet )
                    .splitCsv(header: false, skip: 1)
                    .map{ row -> 
                            {
                                source          = row[0]
                                target          = row[1]

                                return tuple([id:'bulk-copy'], source, target)
                            }
                        }

    } else {

        ch_in_copy = Channel.of([[id:'single-copy'], params.source, params.target])
    }


    COPY ( ch_in_copy )
}


workflow {
    RCLONE ()
}
