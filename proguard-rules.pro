-dontwarn **
-dontnote **
-allowaccessmodification
-repackageclasses godimod.o

-keepattributes *Annotation*,Signature,InnerClasses,EnclosingMethod

-keep @interface net.fabricmc.api.** { *; }
-keep class * implements net.fabricmc.api.ClientModInitializer {
    public void onInitializeClient();
}
-keep class com.godimod.GodiModClient {
    public <init>();
    public void onInitializeClient();
}
