require ["fileinto", "vacation"];

{% if account.av_filter %}
if header :contains "X-Amavis-Alert" "INFECTED" {
	{% if account.av_quarantine %}fileinto "Quarantine"{% else %}discard{% endif %};
	stop;
}
{% endif %}

{% if account.spam_filter %}
if header :contains "X-Spam-Flag" "YES" {
	{% if account.spam_discard %}discard{% else %}fileinto "Spam"{% endif %};
	stop;
}
{% endif %}

{% if account.ar_active %}
vacation
	:days 1
	:subject "{{ account.ar_subject }}"
	"{{ account.ar_message }}";
{% endif %}
