{-# LANGUAGE PatternSynonyms #-}
module JSDOM.Generated.MutationEvent
       (initMutationEvent, pattern MODIFICATION, pattern ADDITION,
        pattern REMOVAL, getRelatedNode, getPrevValue, getNewValue,
        getAttrName, getAttrChange, MutationEvent, castToMutationEvent,
        gTypeMutationEvent)
       where
import Prelude ((.), (==), (>>=), return, IO, Int, Float, Double, Bool(..), Maybe, maybe, fromIntegral, round, realToFrac, fmap, Show, Read, Eq, Ord, Maybe(..))
import Data.Typeable (Typeable)
import Language.Javascript.JSaddle (JSM(..), JSVal(..), JSString, strictEqual, toJSVal, valToStr, valToNumber, valToBool, js, jss, jsf, jsg, function, new, array)
import Data.Int (Int64)
import Data.Word (Word, Word64)
import JSDOM.Types
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Lens.Operators ((^.))
import JSDOM.EventTargetClosures (EventName, unsafeEventName)
import JSDOM.Enums

-- | <https://developer.mozilla.org/en-US/docs/Web/API/MutationEvent.initMutationEvent Mozilla MutationEvent.initMutationEvent documentation> 
initMutationEvent ::
                  (MonadDOM m, ToJSString type', IsNode relatedNode,
                   ToJSString prevValue, ToJSString newValue, ToJSString attrName) =>
                    MutationEvent ->
                      type' ->
                        Bool ->
                          Bool ->
                            Maybe relatedNode ->
                              prevValue -> newValue -> attrName -> Word -> m ()
initMutationEvent self type' canBubble cancelable relatedNode
  prevValue newValue attrName attrChange
  = liftDOM
      (void
         (self ^. jsf "initMutationEvent"
            [toJSVal type', toJSVal canBubble, toJSVal cancelable,
             toJSVal relatedNode, toJSVal prevValue, toJSVal newValue,
             toJSVal attrName, toJSVal attrChange]))
pattern MODIFICATION = 1
pattern ADDITION = 2
pattern REMOVAL = 3

-- | <https://developer.mozilla.org/en-US/docs/Web/API/MutationEvent.relatedNode Mozilla MutationEvent.relatedNode documentation> 
getRelatedNode :: (MonadDOM m) => MutationEvent -> m (Maybe Node)
getRelatedNode self
  = liftDOM ((self ^. js "relatedNode") >>= fromJSVal)

-- | <https://developer.mozilla.org/en-US/docs/Web/API/MutationEvent.prevValue Mozilla MutationEvent.prevValue documentation> 
getPrevValue ::
             (MonadDOM m, FromJSString result) => MutationEvent -> m result
getPrevValue self
  = liftDOM ((self ^. js "prevValue") >>= fromJSValUnchecked)

-- | <https://developer.mozilla.org/en-US/docs/Web/API/MutationEvent.newValue Mozilla MutationEvent.newValue documentation> 
getNewValue ::
            (MonadDOM m, FromJSString result) => MutationEvent -> m result
getNewValue self
  = liftDOM ((self ^. js "newValue") >>= fromJSValUnchecked)

-- | <https://developer.mozilla.org/en-US/docs/Web/API/MutationEvent.attrName Mozilla MutationEvent.attrName documentation> 
getAttrName ::
            (MonadDOM m, FromJSString result) => MutationEvent -> m result
getAttrName self
  = liftDOM ((self ^. js "attrName") >>= fromJSValUnchecked)

-- | <https://developer.mozilla.org/en-US/docs/Web/API/MutationEvent.attrChange Mozilla MutationEvent.attrChange documentation> 
getAttrChange :: (MonadDOM m) => MutationEvent -> m Word
getAttrChange self
  = liftDOM (round <$> ((self ^. js "attrChange") >>= valToNumber))