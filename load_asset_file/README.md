# load_asset_file

Loading asset file examples.

1. Create a folder and put your asset file in it (assets/posts.json)
2. Add path of this file under assets in pubspec.yaml
    ```
          assets:
            - assets/posts.json
    ```

3. Read the file as following:

    ```
    DefaultAssetBundle.of(context).loadString('assets/posts.json')
    ```


