# Read about unicorn workers here:
# http://doc.gitlab.com/ee/install/requirements.html#unicorn-workers
#
worker_processes 3

# nuke workers after 30 seconds instead of 60 seconds (the default)
#
# NOTICE: git push over http depends on this value.
# If you want to be able to push huge amount of data to git repository over http
# you will have to increase this value too.
#
# Example of output if you try to push 1GB repo to GitLab over http.
#   -> git push http://gitlab.... master
#
#   error: RPC failed; result=18, HTTP code = 200
#   fatal: The remote end hung up unexpectedly
#   fatal: The remote end hung up unexpectedly
#
# For more information see http://stackoverflow.com/a/21682112/752049
#
timeout 120
