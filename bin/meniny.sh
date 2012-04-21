#!/usr/bin/perl

# zdroj: http://linuxos.sk/forum/15407/index.html
@meniny_riadky = grep {/meniny/} `wget -q -O - http://www.sme.sk`;
@meniny = grep {/meniny/} split /\|/, $meniny_riadky[0];
($meniny_text) = $meniny[0] =~ /\>(.*)\<\/a\>/;
@mena = split /\s/, $meniny_text;
print "dnes má meniny: ", splice(@mena, 2), "\n"; 
