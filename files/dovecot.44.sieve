# $RuOBSD$
#
# Пример правил для автоматической сортировки писем на Dovecot IMAP сервере.
# Файл кладется в домашний каталог под именем .dovecot.sieve и настраивается
# под свои нужды (для работы требуется dovecot-sieve).
#
# Более подробную информацию можно посмотреть здесь:
#	http://wiki.dovecot.org/LDA/Sieve

# Подключаем нужные процедуры.
#
require ["fileinto", "imapflags", "regex"];

# Письма в рассылку openbsd@openbsd.ru кладем в папку "OpenBSD/ru".
#
if address ["To", "Cc"] ["openbsd@openbsd.ru", "openbsd@cvs.openbsd.ru"] {
	fileinto "OpenBSD.ru";
	stop;
}

# Письма в рассулку tech@openbsd.org кладем в папку "OpenBSD/tech".
#
if address ["To", "Cc"] ["tech@openbsd.org", "tech@cvs.openbsd.org"] {
	fileinto "OpenBSD.tech";
	stop;
}

# Письма от cron задания /etc/security помечаем красным цветом
# в thunderbird.
#
if header :regex "Subject" ".* daily insecurity output" {
	addflag "$label1";
}
