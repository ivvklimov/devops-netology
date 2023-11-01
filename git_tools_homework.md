##### 1. Найдите полный хеш и комментарий коммита, хеш которого начинается на aefea

```git show aefea```

commit aefead2207ef7e2aa5dc81a34aedf0cad4c32545
Author: Alisdair McDiarmid <alisdair@users.noreply.github.com>
Date:   Thu Jun 18 10:29:58 2020 -0400

--------------------------
##### 2. Какому тегу соответствует коммит 85024d3?

*Эта команда покажет ближайший тег, который содержит указанный коммит. Если коммит прямо соответствует тегу, тег будет отображен. Если он не соответствует непосредственно тегу, но находится в коммите, который вошел в версию помеченного тега, то будет показан ближайший тег, который включает этот коммит:*

```git describe --contains 85024d3```

v0.12.23^0

> Синтаксис ^0 в имени тега, такого как v0.12.23^0, в Git указывает на коммит, который является прямым родителем данного тега.
В контексте работы с тегами в Git, обычно теги указывают на определенные коммиты в истории репозитория. Обозначение ^0 означает, что # сам тег указывает на тот же коммит, что и его непосредственный предшественник.
В данном случае, v0.12.23^0 говорит о том, что тег v0.12.23 указывает на тот же коммит, который и его прямой родитель. Это может быть полезно в случаях, когда нужно точно определить коммит, на который указывает тег, несмотря на промежуточные изменения в истории # репозитория.

--------------------------
##### 3. Сколько родителей у коммита b8d720? Напишите их хеши.

*Эта команда отобразит хеши родителей коммита b8d720. Если коммит имеет одного родителя, будет показан только один хеш. Если у коммита несколько родителей (например, в случае слияний), будут отображены хеши всех родителей:*

```git log --pretty=%P -n 1 b8d720```

56cd7859e05c36c06b56d013b55a252d0bb7e158
9ea88f22fc6269854151c571162c5bcf958bee2b

--------------------------
##### 4. Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами v0.12.23 и v0.12.24.

*Для перечисления хешей и комментариев всех коммитов, сделанных между тегами v0.12.23 и v0.12.24, можно использовать команду git log с флагами, ограничивающими вывод только коммитами между определенными тегами:*

```git log --pretty=oneline v0.12.23..v0.12.24```

33ff1c03bb960b332be3af2e333462dde88b2bdfea50cc8 - James Bardin, 2 years, 11 months ago : remove unused
fd4f7eb0b9 - James Bardin, 3 years ago : remove prefixed io
5ac311e2a9 - Martin Atkins, 7 years ago : main: synchronize writes to VT100-faker on Windows
79e (tag: v0.12.24) v0.12.24
b14b74c4939dcab573326f4e3ee2a62e23e12f89 [Website] vmc provider links
3f235065b9347a758efadc92295b540ee0a5e26e Update CHANGELOG.md
6ae64e247b332925b872447e9ce869657281c2bf registry: Fix panic when server is unreachable
5c619ca1baf2e21a155fcdb4c264cc9e24a2a353 website: Remove links to the getting started guide's old location
06275647e2b53d97d4f0a19a0fec11f6d69820b5 Update CHANGELOG.md
d5f9411f5108260320064349b757f55c09bc4b80 command: Fix bug when using terraform login on Windows
4b6d06cc5dcb78af637bbb19c198faff37a066ed Update CHANGELOG.md
dd01a35078f040ca984cdd349f18d0b67e486c35 Update CHANGELOG.md
225466bc3e5f35baa5d07197bbc079345b77525e Cleanup after v0.12.23 release

--------------------------
##### 5. Найдите коммит, в котором была создана функция func providerSource, её определение в коде выглядит так: func providerSource(...) (вместо троеточия перечислены аргументы).

*Для поиска коммита, в котором была создана функция providerSource с определением func providerSource(...), можно воспользоваться командой git log с параметром --oneline для вывода краткой информации о коммитах, и параметром -S для поиска конкретной строки кода:*

```git log -S 'func providerSource(' --oneline```

8c928e8358 main: Consult local directories as potential mirrors of providers

--------------------------
##### 6. Найдите все коммиты, в которых была изменена функция globalPluginDirs.

*Находим в каком файле данная функция:*

```git grep "globalPluginDirs"```

*Используем флаг -L, чтобы найти изменения именно тела функции:*

```git log -L :globalPluginDirs:plugins.go```

78b12205587fe839f10d946ea3fdc06719decb05
52dbf94834cb970b510f2fba853a5b49ad9b1a46
41ab0aef7a0fe030e84018973a64135b11abcd70
66ebff90cdfaa6938f26f908c7ebad8d547fea17
8364383c359a6b738a436d1b7745ccdce178df47

--------------------------
##### 7. Кто автор функции synchronizedWriters?

```git log -S 'func synchronizedWriters(' --pretty=format:"%an <%ae>"```

bdfea50cc8 - James Bardin, 2 years, 11 months ago : remove unused
fd4f7eb0b9 - James Bardin, 3 years ago : remove prefixed io
5ac311e2a9 - Martin Atkins, 7 years ago : main: synchronize writes to VT100-faker on Windows

Автор: Martin Atkins
