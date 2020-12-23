package DataAPIResponseOutput::Tags;

use strict;
use warnings;
use MT;
require HTTP::Request;
use LWP::UserAgent;

sub _hdlr_response_output {
    my ( $ctx, $args, $cond ) = @_;
    my $site_id = $args->{ id } || 1;  # 初期値 blog_id 1
    my $blog = MT::Blog->load($site_id);
    my $cgi = MT->config->AdminCGIPath || MT->config->CGIPath;
    my $url = $args->{ url } || $blog->site_url;  # url 初期値 MTインストールURL
    $url = $1 if($url=~/(.*)\/$/);  # 末尾の / スラッシュ削除
    my $dataapi = $args->{ dataapi } || $cgi . 'mt-data-api.cgi/';  # dataapi 初期値 MTインストールパス + mt-data-api.cgi
    my $endpoint = $args->{ endpoint } || '/sites';  # endpoint 初期値 /sites
    my $version = $args->{ version } || 'v4';  # version 初期値 v4
    my $param = $args->{ param };  # param 初期値 なし
    my $ua = LWP::UserAgent->new;
    my $request = HTTP::Request->new(GET => $url . $dataapi . $version . $endpoint . $param);
    my $response = $ua->request($request);
    return $response->content;
}

1;