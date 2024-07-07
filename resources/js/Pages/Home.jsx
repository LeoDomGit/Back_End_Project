import React, { useEffect, useState } from "react";
import Layout from "../components/Layout";
import CKEditor from "../components/CKEditor";

function Home() {
    const [content, setContent] = useState('');

    const submitCreate = () => {
        console.log(content);
    };

    return (
        <Layout>
            <div>
                <CKEditor value={content} onBlur={setContent} />
                <button className="btn btn-primary" onClick={submitCreate}>
                    Tạo
                </button>
            </div>
        </Layout>
    );
}

export default Home;
