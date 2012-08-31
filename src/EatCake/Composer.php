<?php
namespace EatCake;

class Composer {

	/**
	 * Called after CakePHP was installed
	 */
	public static function afterInstall($event) {
		$options = self::getOptions($event);

		// root of our app
		$baseDir = dirname(dirname(__DIR__)) . DIRECTORY_SEPARATOR;

		// where our app is going to be
		$appDir = $baseDir . $options['cakephp-app-dir'] . DIRECTORY_SEPARATOR;

		// where cakephp was installed with composer
		$installedDir = $baseDir . 'vendor' . DIRECTORY_SEPARATOR . 'cakephp' . DIRECTORY_SEPARATOR . 'cakephp' . DIRECTORY_SEPARATOR;

		// copy app if it exists
		$copyApp = $installedDir . 'app' . DIRECTORY_SEPARATOR;
		if (is_dir($copyApp)) {
			if ($options['is-windows']) {
				exec('xcopy ' . $copyApp . ' ' . $appDir);
			} else {
				exec('cp -R ' . $copyApp . ' ' . $appDir);
			}
		}
	}

	/**
	 * Get options
	 */
	protected static function getOptions($event) {
		$options = array_merge(array(
			'cakephp-app-dir' => 'app',
			'is-windows' => (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') ? true : false,
		), $event->getComposer()->getPackage()->getExtra());
		return $options;
	}
}