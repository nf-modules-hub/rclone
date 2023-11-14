process COPY {
    tag "$meta.id"
    label 'process_low'

    conda "conda-forge::rclone=1.63.1"

    //NOTE: Disable the use of containers for this one since 
    // rclone would need access to possibly multiple locations in the filesystem
    /*
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'docker://docker.io/rclone/rclone:1.63.1':
        'docker.io/rclone/rclone:1.63.1' }"
    */

    input:
    tuple val(meta), val(source), val(target)


    when:
    task.ext.when == null || task.ext.when

    script:

    //NOTE: The args for copy can be obtained from here https://rclone.org/flags/ 
    def args = task.ext.args   ?: ''

    """
    rclone copy \\
        ${source} \\
        ${target} \\
        ${args}
    """
}

