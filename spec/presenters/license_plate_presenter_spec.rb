# encoding: utf-8
# frozen_string_literal: true
require 'rails_helper'

describe LicensePlatePresenter do
  let(:license_plate) do
    instance_double(
      'LicensePlate',
      identifier: identifier,
      comments: comments,
      comments_count: comments_count,
      most_recent_comment: most_recent_comment,
      jurisdiction: jurisdiction
    )
  end
  let(:identifier) do
    'ABC-1234'
  end
  let(:comments) do
    double(
      'ActiveRecord::Relation',
      reverse_chronological_order: [comment_1, comment_2, comment_3],
      build: new_comment
    )
  end
  let(:new_comment) do
    instance_double(
      'Comment'
    )
  end
  let(:comment_1) do
    instance_double 'Comment'
  end
  let(:comment_2) do
    instance_double 'Comment'
  end
  let(:comment_3) do
    instance_double 'Comment'
  end
  let(:comment_presenter_1) do
    instance_double 'Comment'
  end
  let(:comment_presenter_2) do
    instance_double 'Comment'
  end
  let(:comment_presenter_3) do
    instance_double 'Comment'
  end
  let(:comments_count) do
    125
  end
  let(:most_recent_comment) do
    comment_1
  end
  let(:jurisdiction) do
    instance_double(
      'Jurisdiction',
      to_s: jurisdiction_name
    )
  end
  let(:jurisdiction_name) do
    'North Carolina, U.S.A.'
  end

  subject do
    described_class.new(license_plate)
  end

  before do
    allow(CommentPresenter).to receive(:new)
      .and_return(comment_presenter_1, comment_presenter_2, comment_presenter_3)
  end

  describe '#to_s' do
    it 'returns a concatenation of the plate\'s identifier and jurisdiction' do
      expected_string = "#{identifier} - #{jurisdiction_name}"
      expect(subject.to_s).to eql expected_string
    end
  end

  describe '#jurisdiction_options' do
    let(:jurisdiction_names_and_ids) do
      instance_double 'Array'
    end

    before do
      allow(Jurisdiction).to receive(:pluck).with(:name, :id)
        .and_return jurisdiction_names_and_ids
    end

    it 'returns a multidimensional array with the name and id of each '\
      'Jurisdiction' do
      expect(subject.jurisdiction_options).to eql jurisdiction_names_and_ids
    end
  end

  describe '#comments' do
    it 'returns a collection of CommentPresenters in reverse chronological '\
      'order' do
      expected_array = [
        comment_presenter_1,
        comment_presenter_2,
        comment_presenter_3
      ]
      expect(subject.comments).to match_array expected_array
    end
  end

  describe '#new_comment' do
    let(:new_comment_presenter) do
      instance_double(
        'CommentPresenter'
      )
    end

    before do
      allow(CommentPresenter).to receive(:new).with(new_comment)
        .and_return new_comment_presenter
    end

    it 'returns a CommentPresenter for a new comment' do
      expect(subject.new_comment).to eql new_comment_presenter
    end
  end

  describe '#comments_count' do
    it 'returns the count of the license plate\'s comments' do
      expect(subject.comments_count).to eql comments_count
    end
  end

  describe '#most_recent_comment_preview' do
    context 'when the license plate does have a most recent comment' do
      let(:most_recent_comment) do
        comment_1
      end
      let(:most_recent_comment_presenter) do
        instance_double(
          'CommentPresenter',
          message_preview: message_preview
        )
      end
      let(:message_preview) do
        'A humble message.'
      end

      before do
        allow(CommentPresenter).to receive(:new).with(comment_1)
          .and_return most_recent_comment_presenter
      end

      it 'delegates to a CommentPresenter for the most recent comment' do
        expect(subject.most_recent_comment_preview).to eql message_preview
      end
    end

    context 'when the license plate does not have a most recent comment' do
      let(:most_recent_comment) do
        nil
      end

      it 'returns an empty string' do
        expect(subject.most_recent_comment_preview).to eql ''
      end
    end
  end

  describe '#most_recent_comment_timestamp' do
    context 'when the license plate has a most recent comment' do
      let(:most_recent_comment) do
        comment_1
      end
      let(:most_recent_comment_presenter) do
        instance_double(
          'CommentPresenter',
          created_at: comment_timestamp
        )
      end
      let(:comment_timestamp) do
        'February 15, 2016 at 4:15pm'
      end

      before do
        allow(CommentPresenter).to receive(:new).with(comment_1)
          .and_return most_recent_comment_presenter
      end

      it 'delegates to a CommentPresenter for the most recent comment' do
        expect(subject.most_recent_comment_timestamp).to eql comment_timestamp
      end
    end

    context 'when the license plate does not have a most recent comment' do
      let(:most_recent_comment) do
        nil
      end

      it 'returns an empty string' do
        expect(subject.most_recent_comment_timestamp).to eql ''
      end
    end
  end
end
