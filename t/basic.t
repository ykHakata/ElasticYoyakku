use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('ElasticYoyakku');
$t->get_ok('/')->status_is(200)->content_like(qr/Mojolicious/i);

# スマホ用予約確認画面テスト(開発用)
$t->get_ok('/index.html')->status_is(200);

my $index_html_contents = [
    '<title>yoyakku / 予約確認</title>',
];

for my $index_html_content (@{$index_html_contents}) {
    $t->content_like(qr/$index_html_content/i);
}

done_testing();
