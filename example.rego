package opa.example

allow_request {
    not privileged_mode
}

privileged_mode {
# Don't allow to docker load
pattern = "/images/load"
re_match(pattern,input.Path)

}


privileged_mode {
# Only allow some image to map /var/run/docker.sock
pattern = "/var/run/docker.sock:"
re_match(pattern,input.Body.HostConfig.Binds[_])

#Our list of trusted images that can mount /var/run/docker.sock
pattern2 = "nginx|jenkins"
not re_match(pattern2,input.Body.Image)
}



privileged_mode {
# Don't allow to run a specific image
pattern = "jpetazzo/nsenter"
re_match(pattern,input.Body.Image)

}

privileged_mode {
# Don't allow to bind / from host
pattern = "/:"
re_match(pattern,input.Body.HostConfig.Binds[_])

}

privileged_mode {
# Don't allow to bind /etc from host
pattern = "/etc:"
re_match(pattern,input.Body.HostConfig.Binds[_])

}

privileged_mode {
# Don't allow to bind / from host
pattern = "/lib:"
re_match(pattern,input.Body.HostConfig.Binds[_])

}


privileged_mode {
# Don't allow to bind / from host
pattern = "/boot:"
re_match(pattern,input.Body.HostConfig.Binds[_])

}

privileged_mode {
# Don't allow to bind / from host
pattern = "/dev:"
re_match(pattern,input.Body.HostConfig.Binds[_])

}


privileged_mode {
# Don't allow to bind / from host
pattern = "/proc:"
re_match(pattern,input.Body.HostConfig.Binds[_])

}

privileged_mode {
# Don't allow to bind / from host
pattern = "/usr:"
re_match(pattern,input.Body.HostConfig.Binds[_])

}


privileged_mode {
# Don't allow to bind / from host
pattern = "/sys:"
re_match(pattern,input.Body.HostConfig.Binds[_])

}


privileged_mode {
    # This expression asserts that the string on the right-hand side is equal
    # to true referenced on the left-hand side.
    input.Body.HostConfig.Privileged = true
}

privileged_mode {
   # Don't not use Publish all ports
   input.Body.HostConfig.PublishAllPorts = true
}

privileged_mode {
   # Don't not use PidMode host
   input.Body.HostConfig.PidMode = "host"
}

privileged_mode {
   # Don't not use Userns host
   input.Body.HostConfig.UsernsMode="host"
}

privileged_mode {
   # Don't not use IPCMode  host
   input.Body.HostConfig.IpcMode = "host"
}

privileged_mode {
   # Don't not use UTSMode  host
   input.Body.HostConfig.UTSMode = "host"
}

privileged_mode {
  #Never use --net=host
  input.Body.HostConfig.NetworkMode = "host"
}

privileged_mode {
    # This expression asserts that the string on the right-hand side is equal
    # to an element in the array SecurityOpt referenced on the left-hand side.
    input.Body.HostConfig.SecurityOpt[_] = "seccomp:unconfined"
}

##### WIP for docker service and stack

privileged_mode {
# Don't allow to bind /var/run/docker.sock from host
pattern = "/var/run/docker.sock"
re_match(pattern,input.Body.TaskTemplate.ContainerSpec.Mounts[_].Source)
#Our list of trusted images that can mount /var/run/docker.sock
pattern2 = "nginx|jenkins"
not re_match(pattern2,input.Body.TaskTemplate.ContainerSpec.Image)
}