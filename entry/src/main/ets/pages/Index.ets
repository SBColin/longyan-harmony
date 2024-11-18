import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

/**
 *
 */

interface IHomePageData {
  title: string,
  pageNo: number,
}

class Person implements IHomePageData {
  title = "string"
  pageNo = 20
  test: string = "123"
}



@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State btnText: string = "Next";

  build() {
    RelativeContainer() {
      Text(this.message)
        .helloText()
        .backgroundColor(Color.Yellow)
      Button() {
        Text(this.btnText)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .useShadowBatching(false)
          .textCase(TextCase.Normal)
      }
      .type(ButtonType.Capsule)
      .margin({
        top: "20%",
        left: 40
      })
      .height("5%")
      .width("40%")
      .onClick(() => {
        router.pushUrl({ url: "pages/second" }).then(() => {
          console.info('Succeeded in jumping to the second page.')
        }).catch((err: BusinessError) => {
          console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
        })
      })
    }
    .height('50%')
    .width('100%')
  }
}
@Preview
@Component
struct Bottom {
  build() {
    Divider().width("100%").height(50).position({
      bottom:0
    })
  }
}

@Extend(Text)
function helloText() {
  .id('HelloWorld')
  .fontSize(50)
  .fontWeight(FontWeight.Bold)
  .fontColor("blue")
  .alignRules({
    center: { anchor: '__container__', align: VerticalAlign.Center },
    middle: { anchor: '__container__', align: HorizontalAlign.Center }
  })
}
