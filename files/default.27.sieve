require [ "vnd.dovecot.pipe", "subaddress", "envelope", "variables" ];

if envelope :matches :user "to" "*" {
	set :lower "queue" "${1}";
}

if envelope :detail "to" "comment" {
	pipe "mailgate" [ "--queue",  "${queue}", "--action", "comment", "--url", "http://127.0.0.1" ];
} else {
	pipe "mailgate" [ "--queue",  "${queue}", "--action", "correspond", "--url", "http://127.0.0.1" ];
}

