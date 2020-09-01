import { TaGuiPage } from './app.po';

describe('ta-gui App', () => {
  let page: TaGuiPage;

  beforeEach(() => {
    page = new TaGuiPage();
  });

  it('should display welcome message', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('Welcome to app!');
  });
});
