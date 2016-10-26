# [Super Creed](https://telegram.me/CreedsTeam/SuperCreed)
### Based on TeleSeed
# نصب ربات

```sh
# باید اول اینو بگم که یه سرور رو باید بخرین یا داشته باشین که سیستم عامل ابونتو یا لینوکس داشته باشه !
# بعد ترمینال رو باز کنید و روی سرورتون اینارو کپی و پست کنید و کار هایی که گفتیمو اعمال کنید !
# ابتدا باید آپدیت هاشو بزنیم برای همین کد زیر رو بزنید !.
sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make autoconf unzip git redis-server g++ libjansson-dev libpython-dev expat libexpat1-dev
سپس
sudo apt-get update
sudo apt-get upgrade
# حال باید ربات را نصب کنیم !
cd $HOME
git clone https://github.com/Creedsteam/SuperCreed
cd SuperCreed
chmod +x launch.sh
./launch.sh install
./launch.sh
حالا ازتون شماره و کد رو میخواد که میزنید !
در مرحله ی بعد باید ربات رو با فشار دادن همزمان کلید کنترل و c ترمینال رو کنسل کنید ! 
در مرحله ی بعدی بهتون درباره نحوه ادمین اضلی کردن خودتون توی ربات رو یاد دادم بخونید
و در مرحله ی آخر که میخوایم ربات روشن بمونه باید بزنیم :
screen ./launch.sh
شاید با این دستور 1 هفته ربات بدون خاموشی روشن بمونه و یا کمتر و بیشتر !
وقتی هم خاموش شد وصل شین به سرور و دستورات زیرو بزنید :
cd SuperCreed
screen ./launch.sh
با تشکر !
```
### تنظیم گروه مدیریتی !

ابتدا بعد اجرای ربات دستور !id رو توی پیویش بدین !
فایل کانفیگ رو باز کنید و ایدی عددی خودتونو بزارید بجای YourID !
```
  sudo_users = {
    0,
    YourID
  }
```
Then restart the bot.

Create a realm using the `!createrealm <text>` command.

# Special thanks to
[@AmirCreed](https://telegram.me/AmirCreed)

[@EdbAroO](https://telegram.me/EdbAroO)

Logo and Graphic : 

Alfroshotak !

### TeleGram Channel :
[Iran Team](telegram.me/IR_TEAM)
