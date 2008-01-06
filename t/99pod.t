# $Id: 99pod.t 2478 2008-01-06 20:06:49Z comdog $
use Test::More;
eval "use Test::Pod 1.00";
plan skip_all => "Test::Pod 1.00 required for testing POD" if $@;
all_pod_files_ok();