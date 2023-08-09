#!/usr/bin/env nextflow

include { COPY } from "./modules/nf-modules-hub/copy"


/*
#==============================================
rclone
#==============================================
*/

workflow RCLONE {

    if(params.samplesheet) {

        ch_in_copy = Channel.fromFilePairs(params.file_pattern)
                                    .map { t -> [[id: t[0]], t[1]]} 
    } else {

        ch_in_copy = Channel.of([[id:'single-copy'], params.source, params.target])
    }


    COPY ( ch_in_copy )
}


workflow {
    RCLONE ()
}
