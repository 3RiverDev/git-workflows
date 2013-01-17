#!/usr/bin/perl

################################################################################
# Author: Brett Meyer (brett@3riverdev.com)
#
# This workflow is used to cherry-pick commits on a remote branch.  I typically
# use it to manage GitHub pull requests without "merge".  It will:
# 1.) Add the remote
# 2.) Fetch the remote branch
# 3.) Cherry-pick the commits into your current checked-out branch
# 4.) Remove the remote
#
# Usage:
# perl CherryPickFromTemporaryRemote.pl repo_url, branch_name,
#     commit(s)
#
# Examples:
# perl CherryPickFromTemporaryRemoteBranch.pl
#     https://github.com/3RiverDevelopment/GitWorkflows.git branchName
#     0c0e915309cbc0fdf9f6fa56dfa850d7fe95638e
################################################################################

use constant REMOTE_NAME => "TemporaryRemote";
use constant REPO_URL => $ARGV[0];
use constant BRANCH_NAME => $ARGV[1];
use constant COMMIT => $ARGV[2];

system("git", "remote", "add", REMOTE_NAME, REPO_URL);
system("git", "fetch", REMOTE_NAME, BRANCH_NAME);
system("git", "cherry-pick", COMMIT);
system("git", "remote", "rm", REMOTE_NAME);
