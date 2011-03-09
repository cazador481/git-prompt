#!/usr/intel/pkgs/perl/5.10.0-threads-64/bin/perl
#===============================================================================
#
#         FILE:  git_prompt.pl
#
#        USAGE:  ./git_prompt.pl
#
#  DESCRIPTION:  #!/usr/bin/perl
# Author:	elash1
# Purpose:	«enter here»
# Created:	Wed Mar  9 13:21:10 2011
#
#      OPTIONS:  ---
# REQUIREMENTS:  ---
#         BUGS:  ---
#        NOTES:  ---
#       AUTHOR:  YOUR NAME (),
#      COMPANY:
#      VERSION:  1.0
#      CREATED:  03/09/11 13:21:10
#     REVISION:  ---
#===============================================================================

use strict;
use warnings;
use feature qw(say);
use lib "/nfs/site/home/elash1/perl5.10/lib/perl5/x86_64-linux:/nfs/site/home/elash1/perl5.10/lib/perl5"
use Term::ANSIColor qw(colorstrip colored);
if (-d '.git')
{
    my $git_dirty  = 0;
    my @git_status = `git branch &2>/dev/null`;
    my $git_branch = $git_status[1];
    chomp $git_branch;
    my $git_status = `git status &2>/dev/null`;
    if ($git_status =~ /untracked files present/)
    {
        $git_dirty = 1;
    }
    if ($git_dirty)
    {
        print colored($git_branch, 'red');
    }
    else
    {
        print colored($git_branch, 'blue');
    }
}
else
{
#    say "not a git directory";

}
