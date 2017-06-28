#!/bin/sh
sudo mkdir -p /policies
sudo tee /policies/system.rego<<DOG
package system.authz

default allow = false          # Reject requests by default.

allow {                        # Allow request if...
    input.method = "GET"  
}

allow {
    input.method = "POST" 
}

DOG

sudo tee /policies/example.rego<<CAT
package opa.example

allow_request {
    not privileged_mode
}

privileged_mode {
    # Don't allow local binding
    input.Body.HostConfig.Binds != null
}

privileged_mode {
    # Don't enable privileged container
    # This expression asserts that the string on the right-hand side is equal
    # to true referenced on the left-hand side.
    input.Body.HostConfig.Privileged = true
}

CAT
docker run -d -p 8181:8181 -v /policies:/policies openpolicyagent/opa  run --server --log-level debug --authorization=basic /policies/system.rego /policies/example.rego

