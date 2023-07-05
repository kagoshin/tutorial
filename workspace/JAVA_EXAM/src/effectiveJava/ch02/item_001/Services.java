package effectiveJava.ch02.item_001;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author kagoshin
 * サービス登録とアクセスのためのインスタンス化不可能クラス
 */
public class Services {
    // インスタンス化を抑制
    private Services() {
    }

    // サービス名をサービスと対応づける
    private static final Map<String, Provider> providers = new ConcurrentHashMap<String, Provider>();
    public static final String DEFAULT_PROVIDER_NAME = "<def>";

    // プロバイダー登録API
    public static void registerDefaultProvider(Provider p) {
        registerProvider(DEFAULT_PROVIDER_NAME, p);
    }
    public static void registerProvider(String name, Provider p) {
        providers.put(name, p);
    }

    // サービスアクセスAPI
    public static Service newInstance() {
        return newInstance(DEFAULT_PROVIDER_NAME);
    }
    public static Service newInstance(String name) {
        Provider p = providers.get(name);
        if (p == null) {
            throw new IllegalArgumentException("No provider registered with name: " + name);
        }
        return p.newServices();
    }
}
