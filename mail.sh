#minimalist UI of mail through dmenu -> it uses the (file)system of mutt
#
# in a first version it will tell you how many (New) mails do you have and brief info about them :)
# and possibly interact with mutt or something

file_path=~/.local/share/mail/david/INBOX/new
n_mails=$(ls $file_path | wc -l)

chosen=$(grep From $file_path/* | cut -d "<" -f2 | cut -d ">" -f1 | dmenu -l $n_mails -i -p "Mail($n_mails)");
