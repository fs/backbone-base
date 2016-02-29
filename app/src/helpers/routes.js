import MarionetteRoutesHelper from 'marionette-routes-helper';
import AppConfig from 'config';

MarionetteRoutesHelper.initialize({ root: AppConfig.rootPath });

export default MarionetteRoutesHelper;
