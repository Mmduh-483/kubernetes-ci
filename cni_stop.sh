#!/bin/bash -x

#TODO move to a common script

export LOGDIR=$WORKSPACE/logs
export ARTIFACTS=$WORKSPACE/artifacts

export KUBECONFIG=${KUBECONFIG:-/var/run/kubernetes/admin.kubeconfig}

mkdir -p $WORKSPACE
mkdir -p $LOGDIR
mkdir -p $ARTIFACTS

source ./clean_common.sh

function main {

    delete_pods

    stop_system_deployments

    stop_system_daemonset
    
    stop_k8s_screen
    
    asure_all_stoped
    
    delete_chache_files
    
    delete_all_docker_container
    
    delete_all_docker_images
    
    clean_tmp_workspaces
    
    reset_vfs_guids
    
    cp /tmp/kube*.log $LOGDIR
    echo "All logs $LOGDIR"
    echo "All confs $ARTIFACTS"

}

main
