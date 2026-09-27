-dontwarn **
-dontnote **
-dontpreverify
-allowaccessmodification
-repackageclasses x
-flattenpackagehierarchy x
-overloadaggressively
-optimizationpasses 5

-keepattributes *Annotation*

-keep @interface net.fabricmc.api.** { *; }
-keep class com.godimod.GodiModClient {
    public <init>();
    public void onInitializeClient();
}
