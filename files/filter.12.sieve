# Sieve only allows CRLF, never just CR or LF. This text file uses LF.

# https://protonmail.com/support/knowledge-base/sieve-advanced-custom-filters/
# In the ProtonMail header interface:
# envelope-from is equal to the return-path header
# envelope-to is equal to the x-original-to header

require "fileinto";

if header :comparator "i;octet" :is
"X-Original-To" "RoadRunner+ACME@example.org" {
	fileinto "MyLabel";
	fileinto "MyFolder";
}

require ["envelope", "fileinto"];

if envelope :comparator "i;octet" :all :is
"To" "RoadRunner+ACME@example.org" {
	fileinto "MyLabel";
	fileinto "MyFolder";
}

require "fileinto";

# incoming
if header :comparator "i;octet" :is "Delivered-To" "RoadRunner@example.org" {
	fileinto "RR-label";
} elsif header :comparator "i;octet" :is "Delivered-To" "bird@example.org" {
	fileinto "bird-label";
} else {
	fileinto "unknown-label";
}

# outgoing
if address :comparator "i;octet" :all :matches
"From" ["RoadRunner@example.org", "RoadRunner+*@example.org"] {
	fileinto "RR-label";
}
if address :comparator "i;octet" :all :matches
"From" ["bird@example.org", "bird+*@example.org"] {
	fileinto "bird-label";
}

require ["comparator-i;ascii-numeric", "relational", "vnd.proton.expire"];

if anyof (
	not hasexpiration,
	expiration :comparator "i;ascii-numeric" :value "gt" "day" "30"
) {
	expire "day" "30";
}
