package DataAPIResponseOutput::Tags;

use strict;
use warnings;
use MT;
require HTTP::Request;
use LWP::UserAgent;

sub doLog {
    my ($msg, $class) = @_;
    return unless defined($msg);

    require MT::Log;
    my $log = new MT::Log;
    $log->message($msg);
    $log->level(MT::Log::DEBUG());
    $log->class($class) if $class;
    $log->save or die $log->errstr;
}

sub _hdlr_response_output {
    my ( $ctx, $args, $cond ) = @_;
    my $blog = $ctx->stash( 'blog' );
    my $cgi = MT->config->AdminCGIPath || MT->config->CGIPath;
    my $url = $args->{ url } || $blog->site_url;
    my $dataapi = $args->{ dataapi } || $cgi . 'mt-data-api.cgi/';
    my $endpoint = $args->{ endpoint } || '/sites';
    my $version = $args->{ version } || 'v4';
    my $param = $args->{ param };
    my $ua = LWP::UserAgent->new;
    my $request = HTTP::Request->new(GET => $url . $dataapi . $version . $endpoint . $param);
    my $response = $ua->request($request);
    return $response->content;
}

1;