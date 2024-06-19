import React, { useEffect, useRef } from 'react';
import Layout from '../../Components/Layout';
import { CKEditor } from '../../ckeditor5/src/ckeditor';

function Welcome() {

    return (
        <Layout>
            <div className="container-fluid">
           <CKEditor/>
            </div>
        </Layout>
    );
}

export default Welcome;
