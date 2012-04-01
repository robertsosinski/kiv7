require 'spec_helper'

describe Root::NamespaceHelper do
  include Root::NamespaceHelper

  describe '#flag_tag' do
    context 'when not passed a locale' do
      subject { flag_tag }

      it { should eql '<img alt="en" src="/images/flags/en.png" />' }
    end

    context 'when passed :en' do
      subject { flag_tag(:en) }

      it { should eql '<img alt="en" src="/images/flags/en.png" />' }
    end

    context 'when passed :fr' do
      subject { flag_tag(:fr) }

      it { should eql '<img alt="fr" src="/images/flags/fr.png" />' }
    end

    context 'when passed :jp' do
      subject { flag_tag(:jp) }

      it { should eql '<img alt="jp" src="/images/flags/jp.png" />' }
    end
  end
end
