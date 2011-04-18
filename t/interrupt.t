use Test::More;
use JavaScript::V8;

my $c = JavaScript::V8::Context->new;
$c->eval(q{ for(var i = 1; i; i++) { } });
ok $@, "timed out with error";

{
  local $TODO = "return correct error on timeout";
  like $@, qr/terminated/i;
}

done_testing;
