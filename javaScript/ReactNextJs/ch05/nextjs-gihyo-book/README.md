This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `pages/index.tsx`. The page auto-updates as you edit the file.

[API routes](https://nextjs.org/docs/api-routes/introduction) can be accessed on [http://localhost:3000/api/hello](http://localhost:3000/api/hello). This endpoint can be edited in `pages/api/hello.ts`.

The `pages/api` directory is mapped to `/api/*`. Files in this directory are treated as [API routes](https://nextjs.org/docs/api-routes/introduction) instead of React pages.

This project uses [`next/font`](https://nextjs.org/docs/basic-features/font-optimization) to automatically optimize and load Inter, a custom Google Font.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js/) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/deployment) for more details.

## 環境構築
npx create-next-app@latest --ts nextjs-gihyo-book

Tailwind CSS > No
src/ directory > No
App router > No
import alias > No

tsconfig.jsonの編集(p.359)

npm run dev

npm run build
npm run start

## styled-componentsインストール
npm install styled-components@5.3.10
npm install --save-dev @types/styled-components

next.config.js
pages/_document.tsx
pages/_app.tsx の編集(p.361)

## ESLint設定
- typescript-eslint
- @typescript-eslint/eslint-plugin
- @typescript-eslint/parser
- eslint-plugin-prettier
- eslint-plugin-react
- eslint-plugin-react-hooks
- eslint-plugin-import

npm install --save-dev prettier eslint typescript-eslint @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint-config-prettier eslint-plugin-prettier eslint-plugin-react eslint-plugin-react-hooks eslint-plugin-import

.eslintrc.jsonの編集(p.365)

### lintコマンド
npm run lint
→リントを行い、ソースコードの問題を列挙する。
npm run format
→ソースコーとの問題を自動でフォーマットを行う。

## Storybookインストール
npx sb@latest init

## その他プラグインのライブラリ導入
npm install --save-dev @storybook/addon-postcss tsconfig-paths-webpack-plugin @babel/plugin-proposal-class-properties @babel/plugin-proposal-private-methods @babel/plugin-proposal-private-property-in-object tsconfig-paths-webpack-plugin @mdx-js/react

## Storybook起動
npm run storybook

## Stroybookアセット配置用フォルダ
mkdir .storybook/public

.storybook/main.tsの編集(p.372)

## React Hook Form
npm install react-hook-form

## SWR
npm install swr

## React Content Loader
npm install react-content-loader
npm install --save-dev @types/react-content-loader

## Material Icons
npm install @mui/material @mui/icons-material @emotion/react @emotion/styled

## 環境変数
.env

## テスト環境構築

### パッケージインストール
npm install --save-dev @testing-library/jest-dom @testing-library/react jest jest-environment-jsdom

### テスト実行用設定ファイル作成
jest.setup.js
jest.config.js

### テスト実行用スクリプト追加
package.json

### テスト実行
npm run test

## JSON Server
git clone https://github.com/gihyo-book/ts-nextbook-json
cd ts-nextbook-json
npm ci
npm start

### cURL 動作確認
curl -X GET -i http://localhost:8000/users

