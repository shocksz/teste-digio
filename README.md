
# Teste Digio iOS

Para executar este projeto é necessário ter instalado Cocoapods.
Execute o terminal e navegue até o diretório "teste-digio".
No terminal execute o comando "pod install" para instalar as dependências do projeto.
No Finder, dentro do diretório "teste-digio", abra o arquivo "TesteDigio.xcworkspace" para ter acesso ao código fonte do projeto no Xcode.

Em caso de erros de build, no Finder navegue até o diretório "teste-digio" e apague os seguintes arquivos/pastas:

- Pasta Pods
- Podfile.lock
- TesteDigio.xcworkspace
- Execute novamente a instalação das dependências utilizando o comando "pod install" no terminal

Arquitetura utilizada: MVVM

XCode utilizado: 14.0.1

Frameworks de UI utilizados:
- UIStoryboard
- UIXib

Libs utilizadas (via cocoapods):
- Swift Lint (ferramente para impor o estilo e as convenções do Swift, baseado no Swift Style Guide)

Projeto utiliza mock no build configurations Debug do Scheme. No build configurations de Release as chamadas são reais.
