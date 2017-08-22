require 'json'
require 'test/unit'
require './language_versions'

class TestLanguageVersions < Test::Unit::TestCase
  def test_fetch
    expect = JSON.parse(File.read(ENV['TRAVIS'] == '1' ? './test/travis_data.json' : './test/data.json'))

    actual = LanguageVersions.fetch()
    assert_equal(expect, actual)

    actual = LanguageVersions.fetch(['ruby'])
    assert_equal(expect[0], actual[0])
    
    actual = LanguageVersions.fetch(['ruby', 'php'])
    assert_equal([expect[0], expect[1]], [actual[0], actual[1]])
  end
end
